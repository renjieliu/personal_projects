# Auto-elevate with UAC prompt if not running as admin
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    
    $arguments = "-NoProfile -ExecutionPolicy Bypass -File `"" + $PSCommandPath + "`""
    Start-Process -FilePath "powershell.exe" -Verb RunAs -ArgumentList $arguments
    exit
}

# Toggle Touchscreen using PowerShell
$device = Get-PnpDevice | Where-Object { $_.FriendlyName -like "*touch screen*" -and $_.Class -eq "HIDClass" }

if ($null -eq $device) {
    Write-Host "Touchscreen device not found."
    Read-Host -Prompt "Press Enter to exit"
    exit
}

if ($device.Status -eq "OK") {
    Disable-PnpDevice -InstanceId $device.InstanceId -Confirm:$false
    Write-Host "Touchscreen disabled."
} else {
    Enable-PnpDevice -InstanceId $device.InstanceId -Confirm:$false
    Write-Host "Touchscreen enabled."
}

# Wait for user to close
Write-Host "`nPress any key to exit..."
[System.Console]::ReadKey($true) | Out-Null
