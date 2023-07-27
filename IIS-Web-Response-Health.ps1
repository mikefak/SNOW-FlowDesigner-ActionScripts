#IIS Web Response Health
#PS
#input string: $domain_name
try {

    $response = Invoke-WebRequest -Uri $domain_name -Method Head
    if ($response.StatusCode -eq 200) {
        Write-Output "Website is accessible"
    } else {
        Write-Output "Default website is not accessible"
    }
    } catch {"Default Website is not accessible"}
