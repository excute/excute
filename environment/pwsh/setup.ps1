if (Test-Path "$env:OneDrive/Documents/PowerShell/Microsoft.PowerShell_profile.ps1") {
	Remove-Item "$env:OneDrive/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"
}

Copy-Item "./Microsoft.PowerShell_profile.ps1" -Destination "$env:OneDrive/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"
