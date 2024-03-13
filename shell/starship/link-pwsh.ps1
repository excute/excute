
if (-Not (Test-Path "$env:USERPROFILE\.config")) {
	New-Item -ItemType Directory -Path $env:USERPROFILE\.config
}

if (Test-Path "$env:USERPROFILE\.config\starship.toml") {
	Remove-Item "$env:USERPROFILE\.config\starship.toml"
}

New-Item -ItemType HardLink -Path "$env:USERPROFILE\.config\starship.toml" -Target ".\starship.toml"