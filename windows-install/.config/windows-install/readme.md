# Windows Env Setup

This has been created to setup my Development environement on Windows. This can be very handy for setting up new machines and/or Windows Sandbox to test new apps and changes to workflow. 

## Included

- Automatic install of Powershell modules and thier corroponding command line tools.
- Themed prompt via Oh-My-Posh
- Auto completion of commands with list of options via PSReadLine
- Directory navigation by partial names via Z
- Result colorizing and file icons via Terminal Icons

### All Avalible Modules/Tools
- [Oh My Posh](https://ohmyposh.dev/docs/)
- [Git](https://github.com/dahlbyk/posh-git) 
- [Fzf](https://github.com/kelleyma49/PSFzf)
- [PsReadLine](https://docs.microsoft.com/en-us/powershell/module/psreadline/?view=powershell-7.2)
- [Terminal Icons](https://github.com/devblackops/Terminal-Icons)
- [Z](https://www.powershellgallery.com/packages/z/1.1.13)
- [Nvm](https://github.com/aaronpowell/ps-nvm)


## Install 

### Open powershell as admin

Paste the following:

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install -y git
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
git clone https://github.com/julian-iaquinandi/dotfiles.git
Set-ExecutionPolicy -s cu unrestricted -Force
New-Item -Type File -Force "~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
". ~/.config/powershell/profile.ps1" >> "~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
./dotfiles/windows-install/.config/windows-install/install-menu.ps1
```
Select what you would like to be installed **(Windows Terminal and Neovim depend on Powershell Setup)**

### Open Powershell 7 (Core)

Wait for modules to install 

There will be some errors due to PSReadline. These are due to powershell coming with an old verison that's removed on the first run on the powershell profile.

There is no actual error, if you run:

```
pwsh
```

it should reload the shell with no errors.

### Open Windows Terminal
Go to settings and update the font to the font downloaded earlier (Anonymic NF by default)
If seeing any issues please restart the terminal app


## Terminal Themeing

I have included Takuya's Matsuyama's Oh My Posh [theme](https://www.youtube.com/watch?v=5-aK2_WwrmM) as the defalult prompt but there are many prompts avalible [here](https://ohmyposh.dev/docs/themes)

## Credit

This config is a result of watching Takuya Matsuyama's Powershell config [video](https://www.youtube.com/watch?v=5-aK2_WwrmM) and I will continue to build on it with my own preferences. Many thanks to Takuya for creating this video as it's been a big help in recreating my Zsh workflow in Powershell.

This setup has been tested on Windows but could be adpted to work on other OS's. Mac coming soon.

## Differences
These are the inital differences between mine and Takuya's config:

### Automated install process
This repository is currently my dotfiles. When using linux I use stow to copy the files to their correct locations automatically. This install will only copy what's required to your .config folder so there won't be any clashes with existing dotfiles on your system. This is acheived by a set a scripts that can be found in dotfiles/windows-install/.config/windows-install/

If at any time you want to start the install process again run: 

```
. ~/dotfiles/windows-install/.config/windows-install/install-menu.ps1
```

### More Aliases

```
# General
Set-Alias c clear
Set-Alias l ls

# Files/Locations
function .. { cd .. }
function home { cd $env:USERPROFILE }
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

```

### Option to allow tabbing through avalible options rather then printing them to the screen:
```
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
```

### Neovim config
The neovim config started as [quick.nvim](https://github.com/albingroen/quick.nvim) but has since been heavily modified. 


## Todo 
- Z install currently broken
- Neovim config not allowing package install
- Expand nerd font installer to include different types of fonts and accept fontname as an argument
