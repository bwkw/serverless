## OverView
### client
Developed with Next.js 13.3.1 and deployed on AWS CloudFront and S3. (by Terraform)

### server
Developed with Go 1.20 and deployed on AWS API Gateway, Lambda, and DynamoDB. (by Serverless Framework)

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

## Destroy
1. Delete object in s3 bucket

```
(~/serverless) AWS_PROFILE=serverless aws s3 rm s3://staging-serverless-sample --recursive
```

2. Destroy client infra

```
(~/client-infra) AWS_PROFILE=serverless terraform apply
```

3. Destroy server infra

```
(~/server-infra) sls remove --stage prod
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