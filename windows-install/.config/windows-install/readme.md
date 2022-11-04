# Windows Env Setup

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install -y git
```

Reopen Powerhshell

```
git clone https://github.com/julian-iaquinandi/dotfiles.git
Set-ExecutionPolicy -s cu unrestricted -Force
./dotfiles/windows-install/.config/windows-install/install.ps1
```

Open Powershell
```
New-Item -Type File -Force $PROFILE
". ~/.config/powershell/profile.ps1" >> $PROFILE
pwsh
```

Wait for modules to install 
