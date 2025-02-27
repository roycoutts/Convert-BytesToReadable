# The Convert-BytesToReadable function is a PowerShell utility that converts a given number of bytes 
# into a human-readable format using common data size units (Bytes, KB, MB, GB, TB). 
# It automatically selects the most appropriate unit for display, ensuring better readability.

function Convert-BytesToReadable {
    param (
        [Parameter(Mandatory = $true)]
        [double]$Bytes
    )

    $units = @('Bytes', 'KB', 'MB', 'GB', 'TB')
    $size = [math]::Abs($Bytes)  # Handle negative values if needed
    $index = 0

    while ($size -ge 1024 -and $index -lt ($units.Length - 1)) {
        $size = $size / 1024
        $index++
    }

    # Round to 1 decimal place, unless it's a whole number
    if ($size -eq [math]::Floor($size)) {
        $formattedSize = "{0:N0}" -f $size  # No decimals for whole numbers
    } else {
        $formattedSize = "{0:N1}" -f $size  # One decimal place
    }

    # Return original sign if negative
    if ($Bytes -lt 0) {
        return "-$formattedSize $($units[$index])"
    } else {
        return "$formattedSize $($units[$index])"
    }
}