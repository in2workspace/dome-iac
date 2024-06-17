#!/bin/sh

# Install required packages
apk add --no-cache curl openjdk11-jre openssl

# Create a temporal storage
echo "Creating temporal storage..."
mkdir -p /opt/keycloak/conf/tmp
cd /opt/keycloak/conf/tmp

# Delete previous data: truststore, certificates and eu-lotl.xml
echo "Deleting previous data: truststore, certificates and eu-lotl.xml"
rm -f cert_* truststore.jks eu-lotl.xml

# Create an empty truststore.jks if it doesn't exist
if [ ! -f /opt/keycloak/conf/truststore.jks ]; then
  echo "Creating an empty truststore.jks"
  keytool -genkey -alias tempkey -keystore /opt/keycloak/conf/truststore.jks -storepass pempas -keypass pempas -dname "CN=Temp, OU=Temp, O=Temp, L=Temp, ST=Temp, C=US"
  keytool -delete -alias tempkey -keystore /opt/keycloak/conf/truststore.jks -storepass pempas
fi

# Download eu-lotl.xml file
echo "Downloading eu-lotl.xml file..."
curl -s https://sedediatid.mineco.gob.es/Prestadores/TSL/TSL.xml -o eu-lotl.xml

if [ $? -ne 0 ]; then
  echo "Error downloading eu-lotl.xml file."
  exit 1
fi

# Validate that the file was downloaded successfully
if [ ! -f eu-lotl.xml ]; then
  echo "eu-lotl.xml not found after download."
  exit 1
fi

echo "eu-lotl.xml downloaded successfully."

# Extract certificates from eu-lotl.xml
certificates=$(grep -o '<X509Certificate>[^<]*</X509Certificate>' eu-lotl.xml | sed -e 's/<X509Certificate>//g' -e 's/<\/X509Certificate>//g')
count=1

for certificate in $certificates; do
  file="cert_$count.pem"

  if [ -s "$file" ]; then
    echo "$file does exist."
  else
    echo "-----BEGIN CERTIFICATE-----
$certificate
-----END CERTIFICATE-----" > "$file"
  fi

  # Validate that the PEM file was created successfully
  if [ ! -f "$file" ]; then
    echo "Failed to create $file"
    exit 1
  fi

  # Validate that the PEM file is not empty
  echo "Content of $file:"
  cat "$file"

  # Generate a DER file from the PEM file
  openssl x509 -in "$file" -out "cert_$count.der" -outform DER

  # Validate that the DER file was created successfully
  if [ ! -f "cert_$count.der" ]; then
    echo "Failed to create cert_$count.der"
    exit 1
  fi

  # Import the DER file to the truststore
  echo "yes" | keytool -import -alias "cert_$count" -file "cert_$count.der" -keystore /opt/keycloak/conf/truststore.jks -storepass pempas

  if [ $? -ne 0 ]; then
    echo "Failed to import cert_$count.der to truststore.jks"
    exit 1
  fi

  count=$((count + 1))
done

echo "Certificates imported to truststore."

# List the content of the truststore
echo "Truststore content:"
keytool -list -keystore /opt/keycloak/conf/truststore.jks -storepass pempas

# Clean up temporary files
echo "Cleaning up temporary files."
rm -f cert_* eu-lotl.xml

echo "Cleanup completed."

# Iniciar Keycloak
#/opt/keycloak/bin/kc.sh start-dev
