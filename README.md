# self-signed-certificate-notes
- https://timonweb.com/javascript/running-expressjs-server-over-https/
- https://stackoverflow.com/questions/27294589/creating-self-signed-certificate-for-domain-and-subdomains-neterr-cert-commo


### Create new Self Signed Cert
[Script To Generate New Self Signed Cert](https://github.com/synle/self-signed-certificate-notes/blob/main/generate-new-cert.sh)

Or run this

```
curl -s https://raw.githubusercontent.com/synle/self-signed-certificate-notes/main/generate-new-cert.sh | bash
```

### Install cert on Mac Keychain

Note this cert file will be likely shown in
System Keychains > System > Choose certificates tab (refer to this screenshot)

![image](https://user-images.githubusercontent.com/3792401/118021293-f159af00-b30f-11eb-91a5-4837375500a9.png)

![image](https://user-images.githubusercontent.com/3792401/118021532-30880000-b310-11eb-8155-2a533b3f003d.png)


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


### Convert PEM to CRT
```
openssl x509 -outform der -in charles.pem -out charles.crt
```


### Bypass Chrome safe cert
Type in this in the browser background `thisisunsafe`
