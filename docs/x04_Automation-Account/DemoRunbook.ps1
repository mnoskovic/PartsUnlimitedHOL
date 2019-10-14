param
(
    [object]$WebhookData
)
     
# Get Azure Run As Connection Name
$connectionName = "AzureRunAsConnection"
# Get the Service Principal connection details for the Connection name
$servicePrincipalConnection = Get-AutomationConnection -Name $connectionName  

$servicePrincipalConnection | select * | write-output

write-output "Start Stop-Start-AzureVM.ps1"
.\Stop-Start-AzureVM.ps1 -AzureVMList 'All' -Action Start
write-output "Finish Stop-Start-AzureVM.ps1"