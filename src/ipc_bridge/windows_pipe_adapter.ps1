param(
  [string]$PipeName = 'redeclipse-ipc'
)

$pipePath = "\\.\pipe\$PipeName"
$pipe = New-Object System.IO.Pipes.NamedPipeServerStream($PipeName, [System.IO.Pipes.PipeDirection]::InOut)
$pipe.WaitForConnection()
$reader = New-Object System.IO.StreamReader($pipe)
$writer = New-Object System.IO.StreamWriter($pipe)
$writer.AutoFlush = $true

while ($pipe.IsConnected) {
  $line = $reader.ReadLine()
  if ([string]::IsNullOrWhiteSpace($line)) { continue }
  try {
    $payload = $line | ConvertFrom-Json
    if (-not $payload.command) { throw 'Missing command' }
    $writer.WriteLine((@{ ok = $true; forwarded = $payload.command } | ConvertTo-Json -Compress))
  } catch {
    $writer.WriteLine((@{ ok = $false; error = $_.Exception.Message } | ConvertTo-Json -Compress))
  }
}
