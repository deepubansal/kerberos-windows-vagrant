# install tomcat
choco install -y tomcat
refreshenv
& netsh advfirewall firewall add rule name="Tomcat8" dir=in action=allow program="C:\Program Files\Apache Software Foundation\tomcat\apache-tomcat-8.5.12\bin\tomcat8.exe" enable=yes

& netsh advfirewall firewall add rule name="Java" dir=in action=allow program="C:\Program Files\Java\jdk1.8.0_131\bin\java.exe" enable=yes