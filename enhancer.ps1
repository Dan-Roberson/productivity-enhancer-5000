#Author: Dan Roberson

write-host ("Welcome to the productivity enhancer 5000! Enhancing productivity every day by many units.") -ForegroundColor Green
$units = Read-Host "Enter the number of units to enhance productivity by"

$keyBoardObject = New-Object -ComObject WScript.Shell
$StartTime = $(get-date)

$newArrayz = @()
$numer = 200
for($i =0; $i -lt $numer; $i++){
    $random = Get-Random -Maximum 100 -Minimum 0
    $newArrayz += $random / $numer
}

$arraySum = ($newArrayz |Measure-Object -sum ).sum
$finalArray = @()
ForEach ($num in $newArrayz){
    $finalArray += ($num /$arraySum) * $units
}


$percentComplete = 0
$totalUnits = 0
Foreach($unitChunk in $finalArray)
{
  $keyBoardObject.SendKeys("{SCROLLLOCK}")
  $percentComplete += ($unitChunk / $units) * 100
  $totalUnits += $unitChunk
  Write-Progress -Activity $("Enhancing Productivity by $units units.") -Status $("Units Enhanced: $totalUnits") -PercentComplete $percentComplete
  Start-Sleep -Seconds ($unitChunk * 60)
}

write-host ("Your productivity has now been enahnced by $units! Carpultunnel - sieze the day") -ForegroundColor Blue
