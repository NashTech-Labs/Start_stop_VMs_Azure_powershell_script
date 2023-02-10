$VM = Get-Azvm -Status

foreach($VMs in $VM)
{
   $Status = Get-AzVM -ResourceGroupName $VMs.ResourceGroupName -Name $VMs.Name -Status 
    if($Status.Statuses.DisplayStatus[1] -eq "VM deallocated")
    {  

        Write-Output "Starting virtual machine in Azure Cloud...$($VMs.Name)"

        Start-AzVM -ResourceGroupName $VMs.ResourceGroupName -Name $VMs.Name 
    }   
    else
    {
        Write-output "Virtual machine $($VMs.Name) is already in start state in Azure Cloud"
    }
}
