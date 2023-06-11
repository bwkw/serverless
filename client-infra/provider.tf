provider "aws" {
  region      = "ap-northeast-1"
  max_retries = 20
}

provider "aws" {
  alias  = "useast"
  region = "us-east-1"
}
