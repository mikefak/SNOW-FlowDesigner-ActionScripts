# input string = $service_name
$servHealth = Get-Service -name $service_name

if ($servHealth.Status -eq "Running") {
        Write-Output "$service_name is running"
    } else {
        Write-Output "$service_name is stopped/not found"
}
