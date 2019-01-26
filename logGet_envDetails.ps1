# getEventLogs: Maintenance collection script.

$boxName = $env:COMPUTERNAME
$outEvt01 = ".\$($boxName)_EventLog_Apps.csv"
$outEvt02 = ".\$($boxName)_EventLog_System.csv"
$outSvc01 = ".\$($boxName)_Service-RunStates.log"
$outPorts01 = ".\$($boxName)_Network-Ports.log"
$outTask01 = ".\$($boxName)_Tasklist.log"
$outSchTsk01 = ".\$($boxName)_Scheduled-Tasks.log"

Filter timestamp {"Logs collected at $(Get-Date -Format "yyyy-MM-dd HH mm ss")"}

# Application Event Log most recent 100 messages.
Get-EventLog application -newest 100 | Export-Csv $outEvt01
timestamp | Out-File -Append $outEvt01 -Encoding ASCII
Get-EventLog system -newest 100 | Export-Csv $outEvt02
timestamp | Out-File -Append $outEvt02 -Encoding ASCII

# Collect service list and current state of each.
Get-Service | Sort-Object status | Format-Table -AutoSize | Out-File $outSvc01
timestamp | Out-File -Append $outSvc01
# Get process list with relevant details at time of script exec.

cmd /c netstat -aon > $outPorts01
timestamp | Out-File -Append $outPorts01

cmd /c tasklist > $outTask01
timestamp | Out-File -Append $outTask01

Get-ScheduledTask | Select TaskName, State, TaskPath | Sort-Object -Property TaskPath | Format-table -wrap | Out-File $outSchTsk01
timestamp | Out-File -Append $outSchTsk01

# Wrap all these output into update state / append single file.
# Stamp date and Time into said merged output.
# End session delimeter.