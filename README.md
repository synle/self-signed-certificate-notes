# self-signed-certificate-notes
- https://timonweb.com/javascript/running-expressjs-server-over-https/
- https://stackoverflow.com/questions/27294589/creating-self-signed-certificate-for-domain-and-subdomains-neterr-cert-commo


### Create new Self Signed Cert
[Script To Generate New Self Signed Cert](https://github.com/synle/self-signed-certificate-notes/blob/main/generate-new-cert.sh)

Or run this

```
cd ~
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

- Open the `server.crt`
- Click on `Install Certificate...`
- Choose `Local Machine`
- Choose `Place all certificates in the following store`
- Then choose `Trusted Root Certification Authority`
- Choose proceed to install it

![image](https://user-images.githubusercontent.com/3792401/217969137-63699b95-673f-4fca-b81a-aec41a0a2b8b.png)

![image](https://user-images.githubusercontent.com/3792401/217969155-27f214a3-e0f7-463f-9046-43b56891d82f.png)

![image](https://user-images.githubusercontent.com/3792401/217969189-4d3fe0aa-648a-4d71-bb85-b917e6e9c345.png)

![image](https://user-images.githubusercontent.com/3792401/217969245-f95a9e03-bfba-4b5f-98cc-ca054a375096.png)



### Convert PEM to CRT
```
openssl x509 -outform der -in charles.pem -out charles.crt
```


### Bypass Chrome safe cert
Type in this in the browser background `thisisunsafe`

### Hooking up to CRA React App
```
export SSL_CRT_FILE=~/server.crt
export SSL_KEY_FILE=~/server.key
```


### Proxy a http host with https 
```bash
npx local-ssl-proxy --key ~/server.key --cert ~/server.crt --source 3001 --target 3000
```
