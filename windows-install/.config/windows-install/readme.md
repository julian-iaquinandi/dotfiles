# Windows Env Setup

This has been created to setup my Development environement on Windows. This can be very handy for setting up new machines and/or windows sandbox to test new apps and changes to workflow. 

## Open powershell as admin

```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco install -y git
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
git clone https://github.com/julian-iaquinandi/dotfiles.git
Set-ExecutionPolicy -s cu unrestricted -Force
./dotfiles/windows-install/.config/windows-install/install-menu.ps1
```
Select what you would like to be installed (Windows Terminal and Neovim depend on the install of Windows Install)

## Open Powershell 7 (Core)
```
New-Item -Type File -Force $PROFILE
". ~/.config/powershell/profile.ps1" >> $PROFILE
pwsh
```

Wait for modules to install 

There will be some errors due to PSReadline. These are due to powershell coming with an old verison that's removed on the first run on the powershell profile.

There is no actual error, if you run:

```
pwsh
```

it should reload the shell with no errors.


## Open Windows Terminal
Go to settings and update the font to the font downloaded earlier (Anonymic NF by default)



## Reccomended

Install Windows Terminal Theme
```
cd ~\dotfiles\windows-terminal
./link.ps1
```

## Optionally

Install neovim
```
. ~\dotfiles\windows-install\.config\windows-install\install-neovim.ps1
```


** Restart terminal app after running **
