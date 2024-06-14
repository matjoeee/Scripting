#######################################################
### Script to make a virtual environment in Hyper-V ###
#######################################################

# First choose whether to also make a vSwitch or just a Virtual Machine
$response = Read-Host "Do you want to make a new vSwitch? (Y)yes or (N)no: ";
if ($response -like "Y") {
    # Create parameters for the new vSwitch
    $vSwitchName = Read-Host "Name your new virtual switch (no spaces): ";
    $netAdapter = Read-Host "Which network adapter does it connect to? ";
    # Create the new vSwitch
    New-VMSwitch -Name $vSwitchName -NetAdapterName "$netAdapter" -AllowManagementOS:$true;
}
else {
    $vSwitchName = 'Default Switch';
}
# Create parameters for the new Virtual Machine
$vmName = Read-Host "Name your virtual machine: ";
$mem = Read-Host "How many megabytes of RAM does the virtual machine need? (Integer) ";
$memFull = [int64]$mem * 1048576;
$vmPath = Read-Host "Where does the virtual machine have to be saved? (End path with \) ";
$vmFile = $vmPath + $vmName + '.vhdx';
$vmStorage = Read-Host "How much gigabytes of storage does the virtual machine need? (Integer) ";
$vmStorageFull = [int64]$vmStorage * 1073741824;
$isoPath = Read-Host "Which ISO file do you want to use? (Full path) ";
# Create the new Virtual Machine
$virtualMachine = @{
    Name               = $vmName
    Generation         = '2'
    MemoryStartupBytes = $memFull
    NewVHDPath         = $vmFile
    NewVHDSizeBytes    = $vmStorageFull
    SwitchName         = $vSwitchName
}
# Install the Virtual Machine
New-VM @virtualMachine;
Add-VMDvdDrive -VMname $virtualMachine.Name -Path $isoPath;
Set-VMFirmware -VMName $virtualMachine.Name -FirstBootDevice ((Get-VMFirmware -VMName $virtualMachine.Name).BootOrder | Where-Object Device -like *DvD*).Device;
Start-VM -VMName $virtualMachine.Name;