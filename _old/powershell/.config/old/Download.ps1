$powershellDir = "$env:USERPROFILE\.config\powershell"

New-Item -ItemType Directory -Force -Path $powershellDir

cd $powershellDir

Invoke-WebRequest -Uri 'https://gist.githubusercontent.com/kensleDev/13f9290876e782b2e67aab8b463e55f7/raw/6eed78746a14c7e89e7deaa85e6f5e6958a2447a/user_profile.ps1' -OutFile 'user_profile.ps1'
Invoke-WebRequest -Uri 'https://gist.githubusercontent.com/kensleDev/13f9290876e782b2e67aab8b463e55f7/raw/13c1f7eb8ffa50e385c3b960c76ded9389bdaf3e/Install.ps1' -OutFile 'Install.ps1'
Invoke-WebRequest -Uri 'https://gist.githubusercontent.com/kensleDev/13f9290876e782b2e67aab8b463e55f7/raw/13c1f7eb8ffa50e385c3b960c76ded9389bdaf3e/takuya.omp.json' -OutFile 'takuya.omp.json'


