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
