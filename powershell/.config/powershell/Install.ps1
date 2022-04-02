Set-ExecutionPolicy -s cu unrestricted

$OS_Installer = ''

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
      iwr -useb get.scoop.sh -outfile 'scoop-installer.ps1'
      .\scoop-installer.ps1 -ScoopDir 'C:\Applications\Scoop' -ScoopGlobalDir 'C:\GlobalScoopApps' -
      rm scoop-installer.ps1
    } elseif($Installer -eq 'brew') {
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    } else {
      echo 'Installer NOT SUPPORTED!' 
    }
  }
}

function UpdatePowershellConfigLocation {
  $configLocation = ". $env:USERPROFILE\.config\powershell\user_profile.ps1"
  $configLocation | Out-File $PROFILE.CurrentUserCurrentHost
}

function InstallProgram($program) {
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
  InstallProgram('git')
  InstallProgram('z')
  InstallProgram('fzf')
  InstallProgram('nvm')
}

function CleanUp {
  rm $env:USERPROFILE\.config\powershell\- -Force
}

UpdatePowershellConfigLocation
InstallInstaller($OS_Installer)
InstallCmds
InstallModules
CleanUp



