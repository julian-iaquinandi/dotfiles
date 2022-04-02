$OS_Installer = ''

if ($IsMacOS) { $OS_Installer = 'brew' }
elseif ($IsWindows) { $OS_Installer = 'scoop' }
else { echo 'OS NOT SUPPORTED!' }

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

InstallCmds
InstallModules



