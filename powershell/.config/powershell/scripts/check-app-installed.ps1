
function checkIfAppInstalled($software) {
    $chocoApps = choco list -lo -con
    $chocoResult
    Foreach ($app in $chocoApps) {
        $name = $app.ToString().Split(" ")[0]
        $version = $app.ToString().Split(" ")[1]

        if($name -eq $software) {
          $chocoObj = @{
            Name = $name
            Version = $version
          }
          $chocoResult = New-Object -TypeName PsObject -Property $chocoObj
        }
    }

    if($chocoResult.Name.Count -gt 0) {
      # echo "$software is installed via Chocolaty"
    }

    $scoopApps = (scoop list)
    $scoopResult
    Foreach ($app in $scoopApps) {
        if($app.Name -eq "$software") {
          $scoopObj = @{
            Name = $app.Name
            Version = $app.Version
          }
          $scoopResult = New-Object -TypeName PsObject -Property $scoopObj
    }

   }
    if($scoopResult.Name.Count -gt 0) {
      # echo "$software is installed via Scoop"
    }

    $result = $scoopResult.Name.Count + $chocoResult.Name.Count

    # echo "$result"

    if($result -gt 0) {
      return "true"
    } else {
      return "false"
    }

}

