
. c:\vagrant\scripts\stop-tomcat.ps1

Copy-Item c:\vagrant\tomcat\*.conf 'C:\Program Files\Apache Software Foundation\tomcat\apache-tomcat-8.5.12'
Copy-Item c:\vagrant\resources\tomcat.keytab 'C:\Program Files\Apache Software Foundation\tomcat\apache-tomcat-8.5.12'
Copy-Item c:\vagrant\tomcat\webapps\* 'C:\Program Files\Apache Software Foundation\tomcat\apache-tomcat-8.5.12\webapps' -Force

. c:\vagrant\scripts\start-tomcat.ps1