Clear-Variable Desc -ErrorAction Ignore
Clear-Variable ADComputers -ErrorAction Ignore
Clear-Variable Computer -ErrorAction Ignore
Write-Output "Querying AD"
$ADComputers = Get-ADComputer -Filter *
foreach ($computer in $ADComputers) {
    Write-Output "Testing conection to $($computer.name)"
    if (Test-Connection -ComputerName $computer.Name -Count 1 -Quiet) {
        Clear-Variable Desc -ErrorAction Ignore
        Write-Output "Attempting to collect information from $($computer.name)"
        try {
            $compinfo = Get-WmiObject -Class win32_computersystem -ComputerName $computer.name
            $biosinfo = Get-WmiObject -Class win32_bios -ComputerName $computer.name
            $Desc = $compinfo.Manufacturer.trim() + " " + $compinfo.Model.trim() + " (" + $biosinfo.SerialNumber.Trim() + ")"
            Write-Output "Updating AD with: $($computer.name) = $desc"
            Set-ADComputer -Description $Desc -Identity $computer
        } catch {
            Write-Output "Unable to connect via WMI to $($computer.name)"
        }
    } else {
        Write-Output "$($computer.name) appears to be offline"
    }
} 
