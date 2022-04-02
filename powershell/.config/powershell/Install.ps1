Set-ExecutionPolicy RemoteSigned -scope CurrentUser

$OS_Installer = ''

if ($IsMacOS) { 
  $OS_Installer = 'brew'
} elseif ($IsWindows) { 
  $OS_Installer = 'scoop'
  iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
} else { 
  echo 'OS NOT SUPPORTED!' 
}

function InstallInstaller($Installer) {
  if (Get-Command $Installer -errorAction SilentlyContinue) {
    "$Installer Installed"
  } else {
    if($Installer == 'scoop') {
      iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
    } elseif($Installer == 'brew') {
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    } else {
      echo 'Installer NOT SUPPORTED!' 
    }
  }
}

function InstallCmd($program) {
  $cmd = $OS_Installer + ' install ' + $program
  Invoke-Expression $cmd
  echo 'Installed: ' $program
}

function InstallModules {
  Install-Module posh-git -Scope CurrentUser -force
  Install-Module oh-my-posh -Scope CurrentUser -force
  Install-Module Terminal-Icons -Scope CurrentUser -force
  Install-Module -Name z -force
  Install-Module PSReadline -AllowPrerelease -Scope CurrentUser -force -SkipPublisherCheck
  Install-Module PSFzf -Scope CurrentUser -force
  Install-Module nvm
}

function InstallCmds {
  InstallCmd('git')
  InstallCmd('z')
  InstallCmd('fzf')
  InstallCmd('nvm')
}

InstallInstaller
InstallCmds
InstallModules



