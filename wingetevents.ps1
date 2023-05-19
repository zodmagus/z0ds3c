$startDate = (Get-Date).AddDays(-30)
$endDate = Get-Date

$events = Get-WmiObject -Class Win32_Process -Filter "CreationDate >= '$startDate' AND CreationDate <= '$endDate'" |
    Select-Object -Property Name, CreationDate |
    Sort-Object -Property CreationDate -Descending |
    Format-Table -AutoSize

$outputFilePath = Join-Path -Path $PSScriptRoot -ChildPath "output.txt"
$events | Out-File -FilePath $outputFilePath

Write-Host "Information exported to: $outputFilePath"

