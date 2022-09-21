# Docker - local

로컬 환경에 있는 Docker를 사용하여 빌드하고 실행할 수 있다.

## 사용법

### 초기화

```sh
terraform init
```

### 검증

```sh
terraform validate
```

### 실행

```sh
# sudo terraform apply
sudo terraform apply --auto-approve
```

### 제거

```sh
sudo terraform destroy --auto-approve
```

### `.tf` 파일 업데이트 후 재실행

```sh
terraform init --upgrade
sudo terraform apply
```

## 참조

- [Quick start tutorial](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/docker-get-started)
