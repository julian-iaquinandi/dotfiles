if(!$IsMac && !$IsLinux) {
  Set-ExecutionPolicy -s cu unrestricted -Force
}

. ~\.config\powershell\firstRun.ps1

# set PowerShell to UTF-8
[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

function installModule($module) {
  $MOD = Get-Module $module -List 
  If ($MOD) {
    Import-Module $module

  } else {
    Install-Module $module -Force
    Import-Module $module
  }
}

installModule("posh-git")
installModule("Terminal-Icons")
installModule("PSFzf")
installModule("nvm")

if($firstRun -eq "true") {
  Remove-Module PSReadLine
  if($isWindows) {
    Remove-Item "C:\Program Files\WindowsPowerShell\Modules\PSReadline" -Recurse -ErrorAction Ignore
    Remove-Item "C:\Program Files\PowerShell\7\Modules\PSReadLine" -Recurse -ErrorAction Ignore
  }
  (Get-Content ~/.config/powershell/firstRun.ps1).replace('true', 'false') | Set-Content ~/.config/powershell/firstRun.ps1
}

If (Get-Module -ListAvailable -Name PSReadLine) {
  Import-Module PSReadLine
} else {
  Install-Module PSReadLine -Force -AllowPrerelease -SkipPublisherCheck
  Import-Module PSReadLine
}

Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

if(!$IsMac && !$IsLinux) {
  cd ~\AppData\Local\Programs\oh-my-posh\bin
  .\oh-my-posh init pwsh --config ~/.config/powershell/takuya.omp.json | Invoke-Expression
} else {
  oh-my-posh --init --shell pwsh --config ~/.config/powershell/takuya.omp.json | Invoke-Expression
}

cd ~

# Aliases

# General
Set-Alias c clear
Set-Alias l ls

# Files/Locations
function .. { cd .. }
function home { cd $env:USERPROFILE }
function ~ { cd ~ }
function dl { cd $env:USERPROFILE\Downloads }
function docs { cd $env:USERPROFILE\Documents }

# Programs
Set-Alias grep findstr
Set-Alias v nvim

# Git
Set-Alias g git
function ga { git add -A }
function gc { git commit }
function gac { git add -A; git commit }

# Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
