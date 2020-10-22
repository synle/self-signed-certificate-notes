echo '''
######################################################
# OpenSSL config to generate a self-signed crtificate
#
# Create crtificate with:
# openssl req -x509 -new -nodes -days 720 -keyout selfsigned.key -out selfsigned.pem -config openssl.cnf
#
# Remove the -nodes option if you want to secure your private key with a passphrase
#
######################################################

################ Req Section ################
# This is used by the `openssl req` command
# to create a crtificate request and by the
# `openssl req -x509` command to create a
# self-signed crtificate.

[ req ]

# The size of the keys in bits:
default_bits       = 2048

# The message digest for self-signing the crtificate
# sha1 or sha256 for best compatability, although most
# OpenSSL digest algorithm can be used.
# md4,md5,mdc2,rmd160,sha1,sha256
default_md = sha256

# Dont prompt for the DN, use configured values instead
# This saves having to type in your DN each time.

prompt             = no
string_mask        = default
distinguished_name = req_dn

# Extensions added while singing with the `openssl req -x509` command
x509_extensions = x509_ext

[ req_dn ]

countryName            = US
stateOrProvinceName    = CA
organizationName       = Localhost Sy
commonName             = Localhost Sy Test

[ x509_ext ]

subjectKeyIdentifier    = hash
authorityKeyIdentifier  = keyid:always

# No basicConstraints extension is equal to CA:False
# basicConstraints      = critical, CA:False

keyUsage = critical, digitalSignature, keyEncipherment

extendedKeyUsage = serverAuth

subjectAltName = @alt_names

[alt_names]
DNS.1 = localhost
''' > /tmp/openssl.conf

rm server.key server.crt

openssl req -x509 -sha256 -nodes -days 3650 -newkey rsa:2048 -keyout server.key -out server.crt  -config /tmp/openssl.conf
