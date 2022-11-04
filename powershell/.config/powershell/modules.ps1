
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
installModule("PSReadLine")
installModule("PSFzf")
installModule("nvm")
