# Run a PowerShell command and capture its output
$output = Get-Process

# Create an empty array to hold the output
$processes = @()

# Loop through the output and add each process to the array
foreach ($process in $output) {
    $processes += [PSCustomObject]@{
        'Name' = $process.ProcessName
        'ID' = $process.Id
        'Memory (MB)' = "{0:N2}" -f ($process.WorkingSet / 1MB)
    }
}

# Export the array to a CSV file
$processes | Export-Csv -Path "C:\output.csv" -NoTypeInformation

=========================================================================================================================================
# Parsing Data

# Filtering: Use cmdlets like Where-Object or Select-Object to filter or select specific pieces of information from an output stream.
# For example, you can use Get-ChildItem to list all files in a directory, and then pipe the output to Where-Object to filter by file extension:
Get-ChildItem -Path C:\Data -Recurse | Where-Object {$_.Extension -eq '.txt'}
This will only return files with a .txt extension.

# Splitting: Use methods like Split to split a string into substrings based on a delimiter.
# For example, you can split a string that contains comma-separated values into an array of substrings using the Split method:

$string = 'apple,banana,orange'
$array = $string.Split(',')
# This will create an array with three elements: apple, banana, and orange.

# Regular expressions: Use regular expressions (regex) to match and extract patterns from strings.
# For example, you can use a regex to extract email addresses from a string:

$string = 'john.doe@example.com, jane.doe@example.com'
$regex = '[\w.]+@[\w.]+'
$matches = [regex]::Matches($string, $regex)
foreach ($match in $matches) {
    Write-Output $match.Value
}
# This will output:
# john.doe@example.com
# jane.doe@example.com

# Object manipulation: Use PowerShell's object-oriented features to manipulate and transform objects.
# For example, you can use the ForEach-Object cmdlet to loop through a collection of objects and apply a transformation to each one:
Get-Process | ForEach-Object {
    [PSCustomObject]@{
        'Name' = $_.ProcessName
        'Memory (MB)' = "{0:N2}" -f ($_.WorkingSet / 1MB)
    }
}
# This will create a custom object for each running process, with the process name and memory usage (in megabytes).