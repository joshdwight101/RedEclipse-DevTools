const ws = new WebSocket('ws://localhost:8081');
const output = document.getElementById('output');
document.getElementById('send').addEventListener('click', () => {
  const command = document.getElementById('command').value;
  ws.send(JSON.stringify({ command }));
});
ws.addEventListener('message', (event) => {
  output.textContent += `${event.data}\n`;
});
