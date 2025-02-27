# Convert-BytesToReadable

# Convert-BytesToReadable.ps1

PowerShell Function Documentation

## Overview
The `Convert-BytesToReadable` function is a PowerShell utility that converts a given number of bytes into a human-readable format using common data size units (Bytes, KB, MB, GB, TB). It automatically selects the most appropriate unit for display, ensuring better readability.

## Syntax
```powershell

Convert-BytesToReadable -Bytes <double>
```

## Parameters
- **`Bytes`** (Mandatory)  
  - Type: `[double]`  
  - Description: The number of bytes to be converted into a human-readable format.
  - Required: Yes

## Return Value
The function returns a formatted string that represents the byte value in the most suitable unit (Bytes, KB, MB, GB, or TB), rounded to one decimal place when necessary.

## Logic and Functionality
1. The function defines an array of units: `Bytes`, `KB`, `MB`, `GB`, and `TB`.
2. It takes an absolute value of the input to handle negative values.
3. It iterates through the units, dividing by 1024 until the value is below 1024 or the highest unit is reached.
4. It rounds the result to one decimal place unless it is a whole number.
5. If the original value was negative, the sign is retained in the final output.
6. The function returns a formatted string with the converted size and unit.

## Examples
### Example 1: Convert a Small Value
```powershell

PS> Convert-BytesToReadable -Bytes 512
512 Bytes
```

### Example 2: Convert a Large Value
```powershell

PS> Convert-BytesToReadable -Bytes 1048576
1 MB
```

### Example 3: Convert a Negative Value
```powershell

PS> Convert-BytesToReadable -Bytes -5368709120
-5 GB
```

## Edge Cases
- Handles negative values by retaining their sign in the output.
- Properly rounds to one decimal place unless the number is an integer.
- Prevents division beyond the maximum unit (`TB`).

## Use Cases
- Displaying file sizes in a readable format.
- Converting disk space or memory usage values.
- Formatting data transfer metrics.

## Notes
- The function does not support values beyond `TB`.
- It assumes binary-based conversion (1 KB = 1024 Bytes, not 1000).

## Version
- **Author**: Roy Coutts
- **Version**: 1.0
- **Last Updated**: February 27, 2025

