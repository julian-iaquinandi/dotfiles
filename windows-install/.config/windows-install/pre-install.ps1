Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install -y git

git clone https://github.com/julian-iaquinandi/dotfiles.git
cp -r ~/dotfiles/windows-install/.config/* ~/.config/
cp -r ~/dotfiles/powershell/.config/* ~/.config/

powershell ~/.config/windows-install/install.ps1