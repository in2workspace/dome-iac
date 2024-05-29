#!/bin/bash

rm cert_*
rm truststore.jks

# https://ec.europa.eu/tools/lotl/eu-lotl.xml
curl -s https://sedediatid.mineco.gob.es/Prestadores/TSL/TSL.xml > eu-lotl.xml
certificates=$(grep -oP '(?<=<X509Certificate>).*(?=</X509Certificate>)' eu-lotl.xml)
count=1
for certificate in $certificates; do
	file="cert_$count.pem"
	if [ -s "$file" ]; then
    		echo "$file exists."
	else
    		echo "-----BEGIN CERTIFICATE-----
              $certificate
              -----END CERTIFICATE-----" > "$file"
	fi
	# Generate .der file which will be imported into the truststore
	openssl x509 -in "$file" -out "cert_$count.der" -outform DER
	# Import the certificate into truststore
	yes si | keytool -import -alias "cert_$count" -file "cert_$count.der" -keystore /opt/keycloak/conf/truststore.jks -storepass pempas
	count=$((count + 1))
done

rm cert_*

echo "END"

# Iniciar Keycloak
/opt/keycloak/bin/kc.sh start-dev
