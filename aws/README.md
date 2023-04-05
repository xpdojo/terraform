# AWS

AWS Boilerplate

## 준비

- [aws cli](https://github.com/xpdojo/aws/tree/main/aws-cli) 설정이 필요하다.

```sh
aws configure list-profiles
```

```sh
default
root-csim
iam-csim
```

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
make
```

## 배포

```sh
make apply
```

## 제거

```sh
make destroy
```

## 참조

- [Quick start tutorial](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/docker-get-started)
