# params user and password
param(
    [string]$user = "admin",
    [string]$pass,
    [string]$shortDescr = "You didn't enter a description...bad boy!",
    [string]$descr = ""
)


# Build auth header
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $user, $pass)))

# Set proper headers
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add('Authorization',('Basic {0}' -f $base64AuthInfo))
$headers.Add('Accept','application/json')



# Specify endpoint uri
$uri = "https://dev272243.service-now.com/api/now/table/incident"

$body = @{
    "short_description" = $shortDescr
    "description" = $descr
} | ConvertTo-Json

# Specify HTTP method
$method = "post"

# Send HTTP request
$response = Invoke-RestMethod -Headers $headers -Method $method -Uri $uri -ContentType "application/json" -Body $body

# Print response
$response.RawContent