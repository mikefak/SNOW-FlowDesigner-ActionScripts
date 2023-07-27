# input strings:
# $fail_on_purpose
# $service_name
# $close_cpustress
# $host_name

if ($fail_on_purpose -eq $false) { 

$maxAttempts = 3
$attemptCount = 0

do {
    $attemptCount++
    Write-Host "Attempt $attemptCount to restart the service..."

    # Restart the service
    Restart-Service -name $service_name -ErrorAction SilentlyContinue

    # Check if the service is running
    $serviceStatus = Get-Service -name $service_name

    if ($serviceStatus.Status -eq "Running") {
        Write-Host "Service restarted successfully."
        break
    }

    # Check if maximum attempts reached
    if ($attemptCount -eq $maxAttempts) {
        Write-Host "Failed to restart the service after $attemptCount attempts."
        break
    }

    # Wait for a few seconds before the next attempt
    Start-Sleep -Seconds 5
} while ($true)

if ($close_cpustress -eq $true) {
    taskkill /im cpustres64.exe /T /F
}
} else {
    Write-Host "Failed to restart the service"
}
