$VM = Get-Azvm -Status

foreach($VMs in $VM)
{
   $Status = Get-AzVM -ResourceGroupName $VMs.ResourceGroupName -Name $VMs.Name -Status 
    if($Status.Statuses.DisplayStatus[1] -eq "VM running")
    {  

        Write-Output "Stopping virtual machine in Azure Cloud...$($VMs.Name)"

        Stop-AzVM -ResourceGroupName $VMs.ResourceGroupName -Name $VMs.Name -Force
    }   
    else
    {
        Write-output "Virtual machine $($VMs.Name) is already in stopped state in Azure Cloud"
    }
}
