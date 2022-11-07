
function installNerdFont($fontName) {
  Invoke-WebRequest -Uri "https://gist.githubusercontent.com/kensleDev/0ac20b2dff6d856404c3d332aaf50f6d/raw/f276f1cde53c1ccb5876bbe0c5affd93407c9de4/font-dir-install.ps1"  -OutFile "~\Downloads\font-dir-install.ps1"
  Invoke-WebRequest -Uri "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/$fontName.zip"  -OutFile "~\Downloads\$fontName.zip"
  cd ~\Downloads
  Expand-Archive "~\Downloads\$fontName.zip"
  cd "~\Downloads\$fontName"
  . ~\.config\powershell\scripts\font-dir-install.ps1
  cd ~\Downloads
  rm -r "~\Downloads\$fontName"
  rm -r "~\Downloads\$fontName.zip"
}
