Write-Output "Container started:$(Get-Date)"
if (-Not (Test-Path c:\sql\firstrun.txt)){
    powershell C:\install\init-config-start-service.ps1 c:\sql postgres
}
Write-Output "Container setup done:$(Get-Date)"
powershell C:\install\start.ps1 detached c:\sql postgres