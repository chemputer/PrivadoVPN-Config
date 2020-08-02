
#Set Debug to $True to get debug output.
$debug = $False

function Add-AuthText {
    param( [string]$fileName)

(Get-Content $fileName) | Where-Object {$_ -notmatch 'auth-user-pass'}  | 
    Foreach-Object {
        $_ # send the current line to output
         if ($_ -match "#comp-lzo") 
        {
        "comp-lzo"
        "auth-user-pass auth.txt"
        }
    }| Where-Object {$_ -notmatch 'verify-x509-name'} | Where-Object {$_ -notmatch '#comp-lzo'} | Set-Content $fileName

}

 
if ($Args.Length -gt 1){
$dirs = @()
foreach ($a in $Args){
$dirs += $a
}

}elseif ($Args.Length -le 1){
    $rootdir= $PSScriptRoot
    

Write-Host $rootdir
$dirs = Get-ChildItem -Attributes Directory $rootdir
}
if($debug -eq 1){
Write-Host "Length:" + $Args.Length
Write-Host "Args[0]: " + $Args[0]
}
$files = @()
foreach ($directory in $dirs){
    if($debug -eq 1){
    Write-Host "Directory: "  $directory
    Write-Host "m: " (Get-ChildItem($directory))}
    $subdir = Get-ChildItem $directory

    foreach($m in $subdir ){$files += ($rootdir +"\"+ $directory + "\" + $m)}
}

foreach ($f in $files) {
    if([System.IO.Path]::GetExtension($f) -eq ".ovpn") {
        if($debug -eq 1){
        Write-Host $f}
        Add-AuthText($f)
    }
}