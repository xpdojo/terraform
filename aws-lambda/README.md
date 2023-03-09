# AWS Lambda

AWS Lambda를 실행하는 CloutWatch Event를 생성한다.

## 준비

- [aws cli](https://github.com/xpdojo/aws/tree/main/aws-cli) 설정이 필요하다.

```sh
aws configure list
```

```sh
      Name                    Value             Type    Location
      ----                    -----             ----    --------
   profile                <not set>             None    None
access_key     ****************NGXR shared-credentials-file
secret_key     ****************o7/A shared-credentials-file
    region           ap-northeast-2      config-file    ~/.aws/config
```

## 초기화

```sh
terraform init
```

## 검증

```sh
terraform validate
```

## 배포

```sh
# terraform apply
terraform apply -var-file="aws.tfvars" --auto-approve
```

## 제거

```sh
terraform destroy -var-file="aws.tfvars" --auto-approve
```

## `.tf` 파일 업데이트 후 재실행

```sh
terraform init --upgrade
terraform apply
```

## 참조

- [Quick start tutorial](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/docker-get-started)
