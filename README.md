# Terraform

- [Terraform](#terraform)
  - [Install](#install)
    - [Ubuntu 22.04](#ubuntu-2204)
    - [macOS Monterey](#macos-monterey)
    - [Windows 11](#windows-11)
  - [autocomplete](#autocomplete)
  - [Usages](#usages)
    - [Initializing Working Directories](#initializing-working-directories)
    - [Writing and Modifying Terraform Code](#writing-and-modifying-terraform-code)
    - [Provisioning Infrastructure](#provisioning-infrastructure)
    - [Inspecting Infrastructure](#inspecting-infrastructure)
  - [참조](#참조)

## Install

### Ubuntu 22.04

```sh
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
```

```sh
wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
```

```sh
gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint

# rsa4096 2020-05-07
# E8A0 32E0 94D8 EB4E A189  D270 DA41 8C88 A321 9F7B
```

```sh
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
```

```sh
sudo apt update
```

```sh
sudo apt-get install terraform
```

```sh
sh> terraform -v
Terraform v1.2.9
on linux_amd64
```

### macOS Monterey

```sh
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

```sh
brew update
brew upgrade hashicorp/tap/terraform
```

### Windows 11

```ps1
choco install terraform
```

## autocomplete

아래 명령어 실행 후 쉘에 다시 접근한다.

```sh
terraform -install-autocomplete
```

## Usages

```sh
terraform -help
terraform -help init
```

### Initializing Working Directories

- [docs](https://www.terraform.io/cli/init)

```sh
terraform init
```

### Writing and Modifying Terraform Code

- [docs](https://www.terraform.io/cli/code)

`validate` 명령어는 `.tf` 코드를 검증한다.

```sh
terraform validate
```

`fmt` 명령어는 `.tf` 코드를 포맷팅한다.

```sh
# terraform fmt
terraform fmt -diff -recursive
```

### Provisioning Infrastructure

- [docs](https://www.terraform.io/cli/run)

`plan` 명령어는 실행할 작업을 미리 보여준다.

```sh
terraform plan
```

`apply` 명령어는 plan 명령어를 실행한 결과를 실제로 적용한다.

```sh
terraform apply --auto-approve
```

`destroy` 명령어는 apply 명령어를 실행한 결과를 삭제한다.

```sh
terraform destroy --auto-approve
```

### Inspecting Infrastructure

- [docs](https://www.terraform.io/cli/inspect)

`graph` 명령어는 GraphViz를 활용해서 실행할 작업을 시각화한다.

```sh
sudo apt install graphviz
```

```sh
terraform graph | dot -Tsvg > graph.svg
```

## 참조

- [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)
- [Terraform CLI Documentation](https://www.terraform.io/cli)
- [Variables and Outputs](https://www.terraform.io/language/values)
