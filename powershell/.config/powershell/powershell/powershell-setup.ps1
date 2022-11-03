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
  Install-Module posh-git -Scope CurrentUser -force
  # Install-Module -Name z -force
  Install-Module PSReadline -AllowPrerelease -Scope CurrentUser -force -SkipPublisherCheck
  Install-Module PSFzf -Scope CurrentUser -force
  Install-Module Terminal-Icons -Scope CurrentUser -force
}

function InstallPrograms {
  InstallProgram('https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json')
  InstallProgram('git')
  # InstallProgram('z')
  InstallProgram('fzf')
  InstallProgram('nvm')
}

function CleanUp {
  rm $env:USERPROFILE\.config\powershell\- -Force
}

UpdatePowershellConfigLocation
InstallInstaller($OS_Installer)
InstallPrograms
InstallModules
CleanUp
Install-Module nvm