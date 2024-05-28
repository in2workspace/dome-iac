rm cert_*
rm truststore.jks

# https://ec.europa.eu/tools/lotl/eu-lotl.xml
curl -s https://sedediatid.mineco.gob.es/Prestadores/TSL/TSL.xml > eu-lotl.xml
certificates=$(grep -oP '(?<=<X509Certificate>).*(?=</X509Certificate>)' eu-lotl.xml)
count=1
for certificate in $certificates; do
	file="cert_$count.pem"
	if [ -s "$file" ]; then
    		echo "$file ya existe."
	else
    		echo "-----BEGIN CERTIFICATE-----
$certificate
-----END CERTIFICATE-----" > "$file"
	fi
	# Generar file .der para importar en el truststore
	openssl x509 -in "$file" -out "cert_$count.der" -outform DER
	# Importar el certificate al trustore
	yes si | /mnt/c/Users/LauraGarciaFernandez/.jdks/corretto-11.0.22/bin/keytool.exe -import -alias "cert_$count" -file "cert_$count.der" -keystore truststore.jks -storepass pempas
	count=$((count + 1))
done

cp truststore.jks ../keycloak2/truststore.jks
rm cert_*

echo "FIN"