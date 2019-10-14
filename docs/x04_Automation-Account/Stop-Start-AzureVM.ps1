workflow Stop-Start-AzureVM {
Param 
(    
	# [Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()] 
	# [String] 
	# $AzureSubscriptionId, 
	[Parameter(Mandatory=$true)][ValidateNotNullOrEmpty()] 
	[String] 
	$AzureVMList="All", 
	[Parameter(Mandatory=$true)][ValidateSet("Start","Stop")] 
	[String] 
	$Action 

)
	# Converter: Wrapping initial script in an InlineScript activity, and passing any parameters for use within the InlineScript
	# Converter: If you want this InlineScript to execute on another host rather than the Automation worker, simply add some combination of -PSComputerName, -PSCredential, -PSConnectionURI, or other workflow common parameters (http://technet.microsoft.com/en-us/library/jj129719.aspx) as parameters of the InlineScript
	inlineScript {
		$AzureVMList = $using:AzureVMList
		$Action = $using:Action
		
     		
    		# $credential = Get-AutomationPSCredential -Name 'AzureCredential' 
    		# Login-AzureRmAccount -Credential $credential 
    		# Select-AzureRmSubscription -SubscriptionId $AzureSubscriptionId 
    		
    		$ServicePrincipalConnection = Get-AutomationConnection -Name "AzureRunAsConnection"
    		Login-AzureRmAccount `
            -ServicePrincipal `
            -TenantId $ServicePrincipalConnection.TenantId `
            -ApplicationId $ServicePrincipalConnection.ApplicationId `
            -CertificateThumbprint $ServicePrincipalConnection.CertificateThumbprint
		
    		if($AzureVMList -ne "All") 
    		{ 
        		$AzureVMs = $AzureVMList.Split(",") 
        		[System.Collections.ArrayList]$AzureVMsToHandle = $AzureVMs 
    		} 
    		else 
    		{ 
        		$AzureVMs = (Get-AzureRmVM).Name 
				if ($AzureVMs.Count -gt 1) {
					[System.Collections.ArrayList]$AzureVMsToHandle = $AzureVMs 
				}
				else {
					[System.Collections.ArrayList]$AzureVMsToHandle = @($AzureVMs)
				}
    		} 
 		
    		foreach($AzureVM in $AzureVMsToHandle) 
    		{ 
        		if(!(Get-AzureRmVM | ? {$_.Name -eq $AzureVM})) 
        		{ 
            		throw " AzureVM : [$AzureVM] - Does not exist! - Check your inputs " 
        		} 
    		} 
 		
    		if($Action -eq "Stop") 
    		{ 
        		Write-Output "Stopping VMs"; 
        		foreach ($AzureVM in $AzureVMsToHandle) 
        		{ 
            		Get-AzureRmVM -verbose | ? {$_.Name -eq $AzureVM} | Stop-AzureRmVM -Force -verbose
        		} 
    		} 
    		else 
    		{ 
        		Write-Output "Starting VMs"; 
        		foreach ($AzureVM in $AzureVMsToHandle) 
        		{ 
            		Get-AzureRmVM -verbose | ? {$_.Name -eq $AzureVM} | Start-AzureRmVM  -verbose
        		} 
    		}
	}
}