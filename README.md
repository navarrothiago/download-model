## Create a file with your token

```bash
echo "your_huggingface_token" > hf_token.txt
```

## Build the image with the secret

```bash
docker build --secret id=hf_token,src=hf_token.txt -t your-image-name .
```

## Delete the token file after building

```bash
rm hf_token.txt
```
