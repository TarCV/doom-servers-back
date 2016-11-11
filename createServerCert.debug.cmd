set BASEDIR=%CD%

del server.cer
pushd "src\main\resources"
del keystore.p12
REM "%JAVA_HOME%\bin\keytool.exe" -genkeypair -keystore keystore.p12 -dname "CN=doom-servers, OU=Unknown, O=Unknown, L=Unknown, ST=Unknown, C=Unknown" -keypass changeit -storepass changeit -storetype pkcs12 -sigalg SHA1withRSA -alias servercert -ext SAN=DNS:doom-servers -validity 365
"%JAVA_HOME%\bin\keytool.exe" -genkey -keyalg RSA -alias servercert -keystore keystore.p12 -storepass changeit -storetype pkcs12 -validity 360 -keysize 2048 -dname "CN=doom-servers, OU=Unknown, O=Unknown, L=Unknown, ST=Unknown, C=Unknown" -ext SAN=DNS:doom-servers
"%JAVA_HOME%\bin\keytool.exe" -export -keystore keystore.p12 -storepass changeit -storetype pkcs12 -alias servercert -file "%BASEDIR%\server.cer"
popd
echo NOT YET IMPLEMENTED (do this manually): create agent truststore (agentstore.jks) and import the created server.cer there
pause
