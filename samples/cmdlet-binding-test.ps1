[CmdletBinding()]
param()

$isVerbose = $PSCmdlet.MyInvocation.BoundParameters.ContainsKey('Verbose')

if ($PSCmdlet.MyInvocation.BoundParameters.ContainsKey('Verbose')) {
    Write-Host "Verbose mode is enabled."
} else {
    Write-Host "Verbose mode is not enabled."
}

# Example action
Write-Verbose "This is a verbose message."


$isVerbose