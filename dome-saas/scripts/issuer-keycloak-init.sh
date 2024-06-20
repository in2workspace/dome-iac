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

echo "Starting to adding hardcoded certificate"

provided_cert="-----BEGIN CERTIFICATE-----
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
-----END CERTIFICATE-----"

echo "The hardcoded certificate: $provided_cert"

echo "$provided_cert" > provided_cert.pem || handle_error "Failed to create provided_cert.pem"                           

# Convert provided certificate to DER format
openssl x509 -in provided_cert.pem -out provided_cert.der -outform DER || handle_error "Failed to convert provided_cert.pem to DER format"

# Import the provided DER certificate to the truststore
echo "yes" | keytool -import -alias "provided_cert" -file provided_cert.der -keystore /opt/keycloak/conf/truststore.jks -storepass pempas || handle_error "Failed to import provided_cert.der to truststore.jks"
# echo "yes" | keytool -import -alias "provided_cert" -file provided_cert.pem -keystore /opt/keycloak/conf/truststore.jks -storepass pempas || handle_error "Failed to import provided_cert.der to truststore.jks"

echo "Finishing to adding hardcoded certificate"

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
