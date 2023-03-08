# AWS Lambda

AWS Lambda를 실행하는 CloutWatch Event를 생성한다.

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
