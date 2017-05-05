$de = [ADSI]"WinNT://client/Users,group" 
$de.Add("WinNT://windomain/adrian.smith")

Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name DefaultUserName -Value "windomain\adrian.smith"
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name DefaultPassword -Value 'Pa$sw0rd'
