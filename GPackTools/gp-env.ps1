$PATH = [Environment]::GetEnvironmentVariable("PATH", "Machine")
$gp_path = Split-Path $PSScriptRoot
$gp_path = Split-Path $gp_path
echo $gp_path
[Environment]::SetEnvironmentVariable("PATH", "$PATH;$gp_path", "Machine")