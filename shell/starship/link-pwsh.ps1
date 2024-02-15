New-Item -ItemType Directory -Path $env:USERPROFILE\.config 

New-Item -ItemType HardLink -Path $env:USERPROFILE\.config\starship.toml -Target .\starship.toml