## OverView

CloudFront × S3 × API Gateway × Lambda × Dynamo DB

## How to set up
### client
1. Install package

```
yarn
```

2. Check if server run

```
yarn dev
```

### client-infra
1. Create symbolic link

```
ln -s provider.tf envrionment/staging/provider.tf
```

## Deploy
1. Deploy client infra

```
(~/client-infra) AWS_PROFILE=serverless terraform apply
```

2. Build and export Next.js

```
(~/client) yarn build && yarn export
```

3. Upload Next.js to s3

```
(~/serverless) AWS_PROFILE=serverless aws s3 sync client/out s3://staging-serverless-sample
```

4. Build Go 

```
(~/serverless) GOOS=linux GOARCH=amd64 go build -o server-infra/bin/hello server/hello/main.go
```

5. Deploy server infra

```
(~/server-infra) sls deploy --stage prod
```

## Command
### client
- Check if eslint settings work

```
yarn lint-fix
```

- Check if prettier settings work

```
yarn format
```

### client-infra
- Format tf file

```
terraform fmt
```

- Validate tf file

```
terraform validate
```

- Check what will be created

```
AWS_PROFILE=serverless terraform plan
```

- Create resource

```
AWS_PROFILE=serverless terraform apply
```

- Delete resource

```
AWS_PROFILE=serverless terraform destroy
```

### server-infra
- Create aws-go project by serverless framework

```
serverless create --template aws-go-dep --path server-infra
```