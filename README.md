# self-signed-certificate-notes
- https://timonweb.com/javascript/running-expressjs-server-over-https/
- https://stackoverflow.com/questions/27294589/creating-self-signed-certificate-for-domain-and-subdomains-neterr-cert-commo

### Install cert on Mac Keychain

- Drag and drop it `server.crt` into mac keychains
- `Always Trust`

### Install cert on Windows

https://success.outsystems.com/Support/Enterprise_Customers/Installation/Add_self_signed_certificate_to_trusted_root_store_on_OutSystems

https://docs.microsoft.com/en-us/skype-sdk/sdn/articles/installing-the-trusted-root-certificate

- Open cmd and run this`mmc.exe`
- Open menu `File` > `Add/Remove Snap-in`
- `Certificate` > `Computer Account` > `Local Computer`
- `Certificates (Local Computer)` > `Trusted Root Certification Authorities`
- Right click the store (`Trusted Root Certification Authorities`) and choose `All Tasks` > `Import`
- Import cert `server.crt`


### New Cert Script
[Script To Generate New Self Signed Cert](https://github.com/synle/self-signed-certificate-notes/blob/main/generate-new-cert.sh)


### Convert PEM to CRT
```
openssl x509 -outform der -in charles.pem -out charles.crt
```
