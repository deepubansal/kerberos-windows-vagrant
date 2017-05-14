
. c:\vagrant\scripts\stop-tomcat.ps1

Copy-Item c:\vagrant\tomcat\*.conf 'C:\Program Files\Apache Software Foundation\tomcat\apache-tomcat-8.5.12'
Copy-Item c:\vagrant\resources\tomcat.keytab 'C:\Program Files\Apache Software Foundation\tomcat\apache-tomcat-8.5.12'
Copy-Item c:\vagrant\tomcat\webapps\* 'C:\Program Files\Apache Software Foundation\tomcat\apache-tomcat-8.5.12\webapps' -Force

Copy-Item c:\vagrant\tomcat\*.conf 'C:\Program Files\Jetty\jetty-distribution-9.4.5.v20170502'
Copy-Item c:\vagrant\resources\tomcat.keytab 'C:\Program Files\Jetty\jetty-distribution-9.4.5.v20170502'
Copy-Item c:\vagrant\tomcat\webapps\* 'C:\Program Files\Jetty\jetty-distribution-9.4.5.v20170502\webapps' -Force

# This is to change the default port in Jetty to 9999
Copy-Item c:\vagrant\jetty\start.ini 'C:\Program Files\Jetty\jetty-distribution-9.4.5.v20170502'

