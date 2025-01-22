export regname=harborlocal.corp.internal

export regip=172.16.10.10

openssl genrsa -out ca.key 4096
 
openssl req -x509 -new -nodes -sha512 -days 3650 -subj "/C=CN/ST=India/L=India/O=example/OU=Personal/CN=harbor" -key ca.key -out ca.crt
 
openssl genrsa -out registry.key 4096
 
openssl req -sha512 -new -subj "/C=CN/ST=Beijing/L=Beijing/O=example/OU=Personal/CN=$regname" -key registry.key -out registry.csr
 

cat > v3.ext <<-EOF
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1=$regname
IP.1=$regip
EOF

openssl x509 -req -sha512 -days 3650 -extfile v3.ext -CA ca.crt -CAkey ca.key -CAcreateserial -in registry.csr -out registry.crt

openssl x509 -inform PEM -in registry.crt -out registry.cert

