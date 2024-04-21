if (Test-Path "$env:OneDrive/Documents/PowerShell/config.yaml") {
	Remove-Item "$env:OneDrive/Documents/PowerShell/config.yaml"
}

Copy-Item "./config.yaml" -Destination "$env:OneDrive/Documents/PowerShell/config.yaml"

if (Test-Path "$env:OneDrive/Documents/PowerShell/config.json") {
	Remove-Item "$env:OneDrive/Documents/PowerShell/config.json"
}

Copy-Item "./config.json" -Destination "$env:OneDrive/Documents/PowerShell/config.json"
