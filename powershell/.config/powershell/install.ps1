

# Copy config to config dir
if ( -not (Test-Path C:\config) ) {
    mkdir C:\config
}

Copy-Item -Path ..\powershell -Destination C:\config -force


# Install scoop if not installed
$scoopInstalled = "False"
try {
    if(Get-Command scoop){ 
        $scoopInstalled = "True";
    }
}
Catch {
    $scoopInstalled = "False"
}

if($scoopInstalled -eq "False") {
    iwr -useb get.scoop.sh | iex
    scoop bucket add extras
}

scoop install posh-git 
scoop install Terminal-Icons 
scoop install PSFzf
scoop install z

echo "TODO!!"
echo "Replace powershell profile(s) contents with: . C:\config\powershell\profile.ps1"
echo "Default locations can by found with: $PROFILE | Format-List -Force"

