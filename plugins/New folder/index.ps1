
Write-Host "Available Plugins"

Write-Host   =================================
Write-Host            PLUGINS HOME  
Write-Host   =================================
Write-Host    "1. Check SSL CERTIFICATE VALIDITY - SINGLE URL."
Write-Host    "2. Check SSL CERTIFICATE VALIDITY - MULTIPLE URL."
Write-Host    "3. SSL VULNERABILITY ANALYSIS"

$selection = Read-Host "Please make a selection"


switch ($selection)
 {
     '1' {
         'You chose option #1'
     } '2' {
         'You chose option #2'
     } '3' {
         'You chose option #3'
     } 'q' {
         return
     }
 }

Start-Sleep