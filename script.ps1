$startDate = Get-Date
if (Test-Path -Path ".\output\") {
    Remove-Item .\output\ -Recurse -Force
}
mkdir .\output\
foreach ($url in Get-Content .\urls.txt) {
    $name = $url + ".png" -replace "\w+:\/\/(\w+\.?)+\/emojis\/\d{16,24}.\w+\?(\w+=\w+&)+name=", ".\output\"
    Write-Output $name
    Invoke-WebRequest $url -OutFile $name
}

$endDate = Get-Date
$secondsTaken = (New-TimeSpan -Start $startDate -End $endDate).TotalSeconds
Write-Output "Finished in $secondsTaken seconds"