
# HardwareInfo-to-AD-Description Script

This PowerShell script queries Active Directory (AD) for computer objects, tests connectivity to each computer, and collects hardware information from reachable systems. The gathered details include the computer's manufacturer, model, and BIOS serial number. These details are then updated in the "Description" field of the corresponding computer objects in Active Directory.

## Features

- Queries all computer objects from Active Directory.
- Tests the network connectivity of each computer.
- Retrieves the manufacturer, model, and BIOS serial number of each reachable computer using WMI.
- Updates the "Description" field of the AD computer objects with the collected hardware information.
- Logs any errors encountered during the WMI connection or if the computer is offline.

## Prerequisites

- PowerShell 5.1 or later.
- Active Directory PowerShell module installed.
- Necessary permissions to query Active Directory and update computer objects.
- WMI access enabled on the target computers for hardware information retrieval.

## Usage

1. Download the script file (`HardwareInfo-to-AD-Description.ps1`).
2. Open a PowerShell window with administrative privileges.
3. Navigate to the directory containing the script file.
4. Run the script:
   ```powershell
   .\HardwareInfo-to-AD-Description.ps1
   ```

    The script will loop through all the computers in AD, collect the relevant hardware information for reachable systems, and update the "Description" field in Active Directory.

## Output

The script does not create any external files. Instead, it updates the "Description" field for each computer object in AD with the following format:

    [Manufacturer] [Model] ([BIOS Serial Number])

Example:
   ```
   Dell Inc. OptiPlex 7070 (123ABC456DEF)
   ```

The script also logs the following output to the console during execution:
- Whether the computer is reachable or offline.
- The status of the WMI connection for retrieving hardware information.
- Confirmation of successful updates to the AD "Description" field.

## License

This project is licensed under the AGPL-3.0 License - see the LICENSE.md file for details.
