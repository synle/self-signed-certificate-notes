echo """
[ req ]
default_bits       = 2048
default_md = sha256
prompt             = no
string_mask        = default
distinguished_name = req_dn
x509_extensions = x509_ext

[ req_dn ]
countryName            = US
stateOrProvinceName    = CA
organizationName       = _ Sy Test Self Signed Cert $(date +%s)
commonName             = _ Sy Test Self Signed Cert $(date +%s)

[ x509_ext ]
subjectKeyIdentifier    = hash
authorityKeyIdentifier  = keyid:always
keyUsage = critical, digitalSignature, keyEncipherment
extendedKeyUsage = serverAuth
subjectAltName = @alt_names

[alt_names]
DNS.1 = localhost
IP.0  = 127.0.0.1
IP.1  = 192.168.1.1
IP.2  = 192.168.1.2
IP.3  = 192.168.1.3
IP.4  = 192.168.1.4
IP.5  = 192.168.1.5
IP.6  = 192.168.1.6
IP.7  = 192.168.1.7
IP.8  = 192.168.1.8
IP.9  = 192.168.1.9
IP.10 = 192.168.1.10
IP.11 = 192.168.1.11
IP.12 = 192.168.1.12
IP.13 = 192.168.1.13
IP.14 = 192.168.1.14
IP.15 = 192.168.1.15
IP.16 = 192.168.1.16
IP.17 = 192.168.1.17
IP.18 = 192.168.1.18
IP.19 = 192.168.1.19
IP.20 = 192.168.1.20
IP.21 = 192.168.1.21
IP.22 = 192.168.1.22
IP.23 = 192.168.1.23
IP.24 = 192.168.1.24
IP.25 = 192.168.1.25
IP.26 = 192.168.1.26
IP.27 = 192.168.1.27
IP.28 = 192.168.1.28
IP.29 = 192.168.1.29
IP.30 = 192.168.1.30
IP.31 = 192.168.1.31
IP.32 = 192.168.1.32
IP.33 = 192.168.1.33
IP.34 = 192.168.1.34
IP.35 = 192.168.1.35
IP.36 = 192.168.1.36
IP.37 = 192.168.1.37
IP.38 = 192.168.1.38
IP.39 = 192.168.1.39
IP.40 = 192.168.1.40
IP.41 = 192.168.1.41
IP.42 = 192.168.1.42
IP.43 = 192.168.1.43
IP.44 = 192.168.1.44
IP.45 = 192.168.1.45
IP.46 = 192.168.1.46
IP.47 = 192.168.1.47
IP.48 = 192.168.1.48
IP.49 = 192.168.1.49
IP.50 = 192.168.1.50
""" > /tmp/openssl.conf

rm -f server.key server.crt

openssl req -x509 -nodes -days 36500 -newkey rsa:2048 \
  -keyout server.key \
  -out server.crt  \
  -config /tmp/openssl.conf

echo """
############################################
# show content of keys
############################################
cat server.crt # csr cert pem file
cat server.key # key pem file

############################################
# use this command to validate the cert
############################################
openssl x509 -noout -text -in server.crt
"""
