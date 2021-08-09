# Created By BaHTsIzBEdEvi
$Target = "C:\"
$MinSize = 3.0
$Table = @()
gci -Force -Recurse $Target -ErrorAction SilentlyContinue | ? { $_ -is [io.directoryinfo] } | % {
$Fsize = 0
gci -Force -Recurse $_.fullname -ErrorAction SilentlyContinue | % { $Fsize += $_.length }
$Path = $_.fullname
$Size = $Fsize / 1Gb
if ($Size -gt $MinSize) {
$Folder = New-Object PSObject
Add-Member -inputObject $Folder -memberType NoteProperty -name “Path” -value $Path
Add-Member -inputObject $Folder -memberType NoteProperty -name “Size” -value $Size
$Table += $Folder }}
$Table | Out-GridView -Title “Folders Over $MinSize Gb”