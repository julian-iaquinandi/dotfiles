# Powershell Config

This is a full featured powershell config that includes:

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

1. Install Powershell 
- Windows: Get from [Windows Store](https://www.microsoft.com/en-us/p/powershell/9mz1snwt0n5d?activetab=pivot:overviewtab) - This is not the pre-installed version of Powershell(Windows Powershell), although this should work with the pre-installed version.
- OSX: Follow instructions [here](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-macos?view=powershell-7.2) to install homebrew, if already installed: 
```
brew install powershell
```

2. Update font in terminal editor with your faviorite [https://www.nerdfonts.com/font-downloads](Nerd Font)
- Windows: Open Windows Terminal => go to settings => Powershell => Appearence 
- OSX: I prefer [Kitty](https://sw.kovidgoyal.net/kitty/conf/)

3. Start a new Powershell session and copy the content of Download.ps1 into the terminal 
> This will download Install.ps1 and takuya.omp.json to ~/.config/powershell

4. Run ~/.config/powershell/Install.ps1

> This will install the Powershell Module and the corropsonding command line tool if needed.

5. Once the installation has finished restart the shell session or run: 
```
pwsh
```
To restart the shell

## Themeing

I have included Takuya's theme as the defalult prompt but there are many prompts avalible [here](https://ohmyposh.dev/docs/themes)

## Credit

This config is a result of watching Takuya Matsuyama's Powershell config [video](https://www.youtube.com/watch?v=5-aK2_WwrmM) and I will continue to build on it with my own preferences. Many thanks to Takuya for creating this video as it's been a big help in recreating my Zsh workflow in Powershell.

This setup has been tested on Windows and OSX but could quite easily be adapted to work on linux.

These are the inital differences between mine and Takuya's config:

1. More Aliases

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

2. Option to allow tabbing through avalible options rather then printing them to the screen:
```
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
```
