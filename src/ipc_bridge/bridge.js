import fs from 'node:fs';
import net from 'node:net';
import dgram from 'node:dgram';
import { WebSocketServer } from 'ws';

const unixSocketPath = process.env.RE_UNIX_SOCKET || '/tmp/redeclipse.socket';
const wsPort = Number(process.env.RE_WS_PORT || 8081);
const udpHost = process.env.RE_UDP_HOST || '127.0.0.1';
const udpPort = Number(process.env.RE_UDP_PORT || 28801);
const tcpHost = process.env.RE_TCP_HOST || '127.0.0.1';
const tcpPort = Number(process.env.RE_TCP_PORT || 28852);

if (fs.existsSync(unixSocketPath)) fs.unlinkSync(unixSocketPath);

const unixServer = net.createServer((socket) => {
  socket.on('data', (chunk) => process.stdout.write(`[unix] ${chunk.toString('utf8')}\n`));
});
unixServer.listen(unixSocketPath, () => console.log(`UNIX socket listening: ${unixSocketPath}`));

const udpClient = dgram.createSocket('udp4');

function forwardToEngine(command) {
  const data = Buffer.from(`${command}\n`, 'utf8');
  udpClient.send(data, udpPort, udpHost);
  const tcp = net.createConnection({ host: tcpHost, port: tcpPort }, () => {
    tcp.write(data);
    tcp.end();
  });
  tcp.on('error', (err) => console.error(`TCP forward failed: ${err.message}`));
}

const wss = new WebSocketServer({ port: wsPort });
wss.on('connection', (ws) => {
  ws.send(JSON.stringify({ ok: true, message: 'Connected to Red Eclipse bridge' }));
  ws.on('message', (raw) => {
    try {
      const payload = JSON.parse(raw.toString());
      if (!payload.command || typeof payload.command !== 'string') throw new Error('Invalid command');
      forwardToEngine(payload.command);
      ws.send(JSON.stringify({ ok: true, forwarded: payload.command }));
    } catch (error) {
      ws.send(JSON.stringify({ ok: false, error: error.message }));
    }
  });
});

console.log(`WebSocket bridge listening: ws://0.0.0.0:${wsPort}`);
