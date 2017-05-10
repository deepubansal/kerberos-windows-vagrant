# install jetty

New-Item -ItemType Directory -Force -Path "C:\Program Files\Jetty"

Invoke-WebRequest -Uri "http://central.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.5.v20170502/jetty-distribution-9.4.5.v20170502.zip" -OutFile "C:\Program Files\Jetty\jetty-distribution-9.4.5.v20170502.zip"

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip "C:\Program Files\Jetty\jetty-distribution-9.4.5.v20170502.zip" "C:\Program Files\Jetty\"

& netsh advfirewall firewall add rule name="Java" dir=in action=allow program="C:\Program Files\Java\jdk1.8.0_131\bin\java.exe" enable=yes

