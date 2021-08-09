# Created By BaHTsIzBEdEvi
$Target = "C:\"
$MinSize = 0.2
$Table = @()
gci -Force -Recurse $Target -ErrorAction SilentlyContinue | % {
$Path = $_.fullname
$Size = $_.length / 1Gb
if ($Size -gt $MinSize) {
$Folder = New-Object PSObject
Add-Member -inputObject $Folder -memberType NoteProperty -name “Path” -value $Path
Add-Member -inputObject $Folder -memberType NoteProperty -name “Size” -value $Size
$Table += $Folder }
}
$Table | Out-GridView -Title “Files Over $MinSize Gb”