# Define the path to the input file
$inputFile = "env-variables.txt"

# Check if the input file exists
if (-Not (Test-Path $inputFile)) {
    Write-Host "Input file not found: $inputFile"
    exit
}

# Read the input file line by line
Get-Content $inputFile | ForEach-Object {
    $line = $_.Trim()

    # Skip empty lines and comments
    if (-Not [string]::IsNullOrWhiteSpace($line) -and -Not $line.StartsWith('#')) {
        # Split the line into name and value
        $parts = $line -split '=', 2
        if ($parts.Length -eq 2) {
            $varName = $parts[0].Trim()
            $varValue = $parts[1].Trim()

            if ($varName -eq 'PATH') {
                # Get the current PATH variable
                $currentPath = [System.Environment]::GetEnvironmentVariable('PATH', [System.EnvironmentVariableTarget]::User)

                # Check if the new path is already in the PATH variable
                if ($currentPath -notlike "*$varValue*") {
                    # Append the new path to the existing PATH variable
                    $newPath = "$currentPath;$varValue"
                    [System.Environment]::SetEnvironmentVariable('PATH', $newPath, [System.EnvironmentVariableTarget]::User)
                    Write-Host "Path '$varValue' added to the PATH variable successfully."
                } else {
                    Write-Host "Path '$varValue' is already in the PATH variable."
                }
            } else {
                # Set the environment variable for the user
                [System.Environment]::SetEnvironmentVariable($varName, $varValue, [System.EnvironmentVariableTarget]::User)

                # Check if the variable was set successfully
                $setValue = [System.Environment]::GetEnvironmentVariable($varName, [System.EnvironmentVariableTarget]::User)
                if ($setValue -eq $varValue) {
                    Write-Host "Environment variable '$varName' set to '$varValue' successfully for the user."
                } else {
                    Write-Host "Failed to set environment variable '$varName'."
                }
            }
        } else {
            Write-Host "Invalid line format: $line"
        }
    }
}
