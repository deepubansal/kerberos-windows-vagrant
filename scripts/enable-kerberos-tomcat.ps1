
. c:\vagrant\scripts\stop-tomcat.ps1

Copy-Item c:\vagrant\tomcat\*.conf 'C:\Program Files\Apache Software Foundation\tomcat\apache-tomcat-8.5.12'
Copy-Item c:\vagrant\tomcat\*.ini 'C:\Program Files\Apache Software Foundation\tomcat\apache-tomcat-8.5.12'
Copy-Item c:\vagrant\resources\tomcat.keytab 'C:\Program Files\Apache Software Foundation\tomcat\apache-tomcat-8.5.12\conf'
Copy-Item c:\vagrant\tomcat\conf\web.xml 'C:\Program Files\Apache Software Foundation\tomcat\apache-tomcat-8.5.12\conf' -Force

Copy-Item c:\vagrant\tomcat\lib\* 'C:\Program Files\Apache Software Foundation\tomcat\apache-tomcat-8.5.12\lib' -Force
Copy-Item c:\vagrant\tomcat\webapps\ROOT\* 'C:\Program Files\Apache Software Foundation\tomcat\apache-tomcat-8.5.12\webapps\ROOT' -Force

. c:\vagrant\scripts\start-tomcat.ps1