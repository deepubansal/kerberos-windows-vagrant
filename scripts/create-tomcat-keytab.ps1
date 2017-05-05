Import-Module ActiveDirectory
Try {
  NEW-ADOrganizationalUnit -name "IT-Services"
} Catch {}
Try {
  NEW-ADOrganizationalUnit -name "ServiceAccounts" -path "OU=IT-Services,DC=windomain,DC=local"
} Catch {}

$identity = "tomcat"
$hostname = "web"
$password = 'MyPa$sw0rd'

Try {
  Remove-ADUser -Identity $identity -Confirm:$false
} Catch {}

New-ADUser -SamAccountName $identity -GivenName "Tomcat SSO" -Surname "Tomcat SSO" -Name $identity `
  -CannotChangePassword $true -PasswordNeverExpires $true -Enabled $true `
  -Path "OU=ServiceAccounts,OU=IT-Services,DC=windomain,DC=local" `
  -AccountPassword (ConvertTo-SecureString -AsPlainText $password -Force)

# http://www.jeffgeiger.com/wiki/index.php/PowerShell/ADUnixImport
Get-ADUser -Identity $identity | Set-ADAccountControl -DoesNotRequirePreAuth:$true

# create keytab

New-Item -Path c:\vagrant\resources -type directory -Force -ErrorAction SilentlyContinue
If (Test-Path c:\vagrant\resources\$identity.keytab) {
  Remove-Item c:\vagrant\resources\$identity.keytab
}

$servicePrincipalName = 'HTTP/' + $hostname + '.windomain.local@WINDOMAIN.LOCAL'
& ktpass -out c:\vagrant\resources\$identity.keytab -princ $servicePrincipalName -mapUser "WINDOMAIN\$identity" -mapOp set -pass $password  -crypto RC4-HMAC-NT -ptype KRB5_NT_PRINCIPAL

If (Test-Path c:\vagrant\resources\$identity.keytab) {
  Write-Host -fore green "Keytab created for user $identity at c:\vagrant\resources\$identity.keytab"

  & setspn -l $identity
} else {
  Write-Host -fore red "Keytab not created"
}

