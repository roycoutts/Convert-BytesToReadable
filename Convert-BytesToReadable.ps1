function Convert-BytesToReadable {
    <#
    .SYNOPSIS
        Converts a byte value into a human-readable format with appropriate units.

    .DESCRIPTION
        Takes a numeric value in bytes and converts it to a readable string with the appropriate unit
        (Bytes, KB, MB, GB, or TB). The output includes one decimal place unless the number is whole,
        and preserves negative values if present.

    .PARAMETER Bytes
        The number of bytes to convert. Accepts positive or negative double-precision floating-point numbers.
        This parameter is mandatory.

    .EXAMPLE
        Convert-BytesToReadable -Bytes 1536
        Returns "1.5 KB"

    .EXAMPLE
        Convert-BytesToReadable -Bytes 1048576
        Returns "1.0 MB"

    .EXAMPLE
        Convert-BytesToReadable -Bytes -5242880
        Returns "-5.0 MB"

    .INPUTS
        Double

    .OUTPUTS
        String

    .NOTES
        - Uses binary units (powers of 1024) rather than decimal units (powers of 1000)
        - Rounds to one decimal place unless the result is a whole number
        - Maintains the sign of the input value
    #>
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
