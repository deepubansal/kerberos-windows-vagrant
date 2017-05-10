
. c:\vagrant\scripts\insert-ssh-key.ps1
. c:\vagrant\scripts\install-java.ps1
. c:\vagrant\scripts\install-tomcat.ps1
. c:\vagrant\scripts\install-jetty.ps1

$de = [ADSI]"WinNT://web/Administrators,group" 
$de.Add("WinNT://windomain/tomcat")
$de = [ADSI]"WinNT://web/Users,group" 
$de.Add("WinNT://windomain/tomcat")

Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name DefaultUserName -Value "windomain\tomcat"
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name DefaultPassword -Value 'MyPa$sw0rd'
