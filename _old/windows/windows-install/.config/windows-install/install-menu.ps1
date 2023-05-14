function writeMenu($choices) {
    write-host ""
    write-host "A - Powershell Setup (Selected by default)"
    write-host "B - Windows Terminal Apps (Powershell 7, Windows Terminal)"
    write-host "C - Nevoim Setup"
    write-host ""
    write-host "Y - Accept"
    write-host "X - Exit"
    write-host ""
    write-host "Current choices are $choices"
    write-host ""
    write-host -nonewline "Type your choice and press Enter: "

}

$choices = New-Object Collections.Generic.List[Int]
$choices += "A"

do {
    do {

        clear

        writeMenu($choices)

        $choice = read-host
        
        write-host ""
        
        $ok = $choice -match '^[abcdx]+$'
        
        if ( -not $ok) { write-host "Invalid selection" }
    } until ( $ok )
    
    switch -Regex ( $choice ) {
        "A"
        {
            if($choices -contains "A") {
              write-host "'A' is already selected"
            } else {
              write-host "You entered 'A'"
              $choices += "A"
            }
        }
        
        "B"
        {
            if($choices -contains "B") {
              write-host "'B' is already selected"
            } else {
              write-host "You entered 'B'"
              $choices += "B"
            }
        }

        "C"
        {
           if($choices -contains "C") {
              write-host "'C' is already selected"
            } else {
              write-host "You entered 'C'"
              $choices += "C"
            }
        }
    }
} until ( $choice -match "X" )


foreach ($choice in $choices) {

  if($choice -eq "A") {
    . ~/dotfiles/powershell/.config/powershell/setup-powershell.ps1
  }

  if($choice -eq "B") {
    . ~/dotfiles/windows-install/.config/windows-install/install-desktop.ps1
    # cd ~/dotfiles/windows-terminal
    # . link.ps1
    # cd ~
  }

  if($choice -eq "C") {
    . ~/dotfiles/nvim/.config/nvim/install-neovim.ps1
  }

}
