## OverView

CloudFront × S3 × API Gateway × Lambda × Dynamo DB

## How to set up
### client
1. Install package

```
yarn
```

2. Check if eslint settings work

```
yarn run lint-fix
```

3. Check if prettier settings work

```
yarn run format
```

4. Check if server run

```
yarn run dev
```

### infra
1. create symbolic link

```
ln -s ../../provider.tf provider.tf
```

2. upload Next.js to s3

```
npm run build && npm run export
AWS_PROFILE=serverless aws s3 sync client/out s3://staging-serverless-sample
```

## Command
- format tf file

```
terraform fmt
```

- validate tf file

```
terraform validate
```

- check what will be created

```
AWS_PROFILE=serverless terraform plan
```

- create resource

```
AWS_PROFILE=serverless terraform apply
```

- delete resource

```
AWS_PROFILE=serverless terraform destroy
```
