[CmdletBinding()]
param()

$services = Get-Service -ErrorAction SilentlyContinue
$user = Get-Content -Path ".\.password" -First 1
$pass = Get-Content -Path ".\.password" -Last 1

$isVerbose = $PSCmdlet.MyInvocation.BoundParameters.ContainsKey('Verbose')

$jobs = foreach ($service in $services) {
    "& .\create-incident.ps1 -user '$user' -pass '$pass' -shortDesc 'JOBFAIL ($(Get-Date)): ServiceName $($service.Name)'"
}

if ($isVerbose) {
    Write-Verbose "Here are the commands that will be executed:"
    $jobs | Write-Verbose
} else {
    Write-Host "Submitting commands to create incidents..."
    $jobs | Invoke-Expression 


}