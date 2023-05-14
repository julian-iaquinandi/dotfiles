Import-Module posh-git
Import-Module -Name Terminal-Icons

# FZF
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Oh my posh
oh-my-posh init pwsh | Invoke-Expression

cd C:\Users\juliani\AppData\Local\Programs\oh-my-posh\bin
.\oh-my-posh.exe init pwsh --config C:/config/powershell/takuya.omp.json | Invoke-Expression

# PS Read Line
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Aliases

## General
Set-Alias c clear
Set-Alias l ls

## Files/Locations
function .. { cd .. }
function home { cd $env:USERPROFILE }
function ~ { cd ~ }
function dl { cd $env:USERPROFILE\Downloads }
function docs { cd $env:USERPROFILE\Documents }

## Programs
Set-Alias grep findstr
Set-Alias v nvim

## Git
Set-Alias g git
function ga { git add -A }
function gc { git commit }
function gac { git add -A; git commit }

## Utilities
function which ($command) {
  Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}