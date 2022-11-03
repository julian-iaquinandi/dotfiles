
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install -y git

git clone https://github.com/julian-iaquinandi/dotfiles.git
cp -r ~/dotfiles/windows-install/.config/* ~/.config/
cp -r ~/dotfiles/powershell/.config/* ~/.config/

Invoke-WebRequest -Uri "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"  -OutFile "~\Downloads\VCLibs.appx"
Add-AppxPackage -Path "~\Downloads\VCLibs.appx"

choco install -y  powershell-core microsoft-windows-terminal  

# Dependancies
Invoke-WebRequest -Uri "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"  -OutFile "~\Downloads\VCLibs.appx"
Add-AppxPackage -Path "~\Downloads\VCLibs.appx"


Set-ExecutionPolicy -s cu unrestricted

$OS_Installer = 'scoop'

if ($IsMacOS) { 
  $OS_Installer = 'brew'
} elseif ($IsWindows) { 
  $OS_Installer = 'scoop'
} else {
  echo 'OS NOT SUPPORTED!' 
}

function InstallInstaller($Installer) {
  if (Get-Command $Installer -errorAction SilentlyContinue) {
    "-> $Installer Installed"
  } else {
    if($Installer -eq 'scoop') {
      iex "& {$(irm get.scoop.sh)} -RunAsAdmin"
    } elseif($Installer -eq 'brew') {
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    } else {
      echo 'Installer NOT SUPPORTED!' 
    }
  }
}

function UpdatePowershellConfigLocation {
  $configLocation = ". $env:USERPROFILE\.config\powershell\profile.ps1"
  $configLocation | Out-File $PROFILE
}

function InstallProgram($program) {
  $cmd = $OS_Installer + ' install ' + $program
  Invoke-Expression $cmd
  echo 'Installed: ' $program
}

function InstallModules {
  Install-Module posh-git -Scope CurrentUser -Force
  # Install-Module -Name z -Force
  Install-Module PSReadline -Force
  Install-Module PSFzf -Scope CurrentUser -Force
  Install-Module Terminal-Icons -Scope CurrentUser -Force
}

function InstallPrograms {
  InstallProgram('https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json')
  # InstallProgram('git')
  # InstallProgram('z')
  InstallProgram('fzf')
  InstallProgram('nvm')
}

UpdatePowershellConfigLocation
InstallInstaller($OS_Installer)
InstallPrograms
InstallModules
Install-Module nvm