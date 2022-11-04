Set-ExecutionPolicy -s cu unrestricted -Force

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
  Remove-Item "C:\Program Files\WindowsPowerShell\Modules\PSReadline" -Recurse -ErrorAction Ignore
  Remove-Item "C:\Program Files\PowerShell\7\Modules\PSReadLine" -Recurse -ErrorAction Ignore
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


cd C:\Users\WDAGUtilityAccount\AppData\Local\Programs\oh-my-posh\bin
.\oh-my-posh init pwsh --config ~/.config/powershell/takuya.omp.json | Invoke-Expression

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

function installFontsInThisDir() {
echo "Install fonts"
$fonts = (New-Object -ComObject Shell.Application).Namespace(0x14)
foreach ($file in gci *.ttf)
{
    $fileName = $file.Name
    if (-not(Test-Path -Path "C:\Windows\fonts\$fileName" )) {
        echo $fileName
        dir $file | %{ $fonts.CopyHere($_.fullname) }
    }
}
cp *.ttf c:\windows\fonts\
}


function nerdFontInstall() {
# Install nerd font from https://www.nerdfonts.com/font-downloads
$fontName = "AnonymousPro"
Invoke-WebRequest -Uri "https://gist.githubusercontent.com/kensleDev/0ac20b2dff6d856404c3d332aaf50f6d/raw/f276f1cde53c1ccb5876bbe0c5affd93407c9de4/font-dir-install.ps1"  -OutFile "~\Downloads\font-dir-install.ps1"
Invoke-WebRequest -Uri "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/$fontName.zip"  -OutFile "~\Downloads\$fontName.zip"
cd ~\Downloads
Expand-Archive "~\Downloads\$fontName.zip"
cd "~\Downloads\$fontName"
. ~\Downloads\font-dir-install.ps1
cd ~\Downloads
rm -r "~\Downloads\$fontName"
}
