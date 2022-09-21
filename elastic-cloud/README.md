# Elastic Cloud

- [Deployments](https://cloud.elastic.co/deployments)

## Creating a Cloud API Key

> Cloud > Manage Deployments > Features > API Keys

![Elastic Cloud Deployement API key](images/elastic-cloud-deployment-api-key.png)

_[Deployment Features](https://cloud.elastic.co/deployment-features/keys)_

## 실행

```sh
terraform init
terraform validate
terraform apply -var-file="prod.ec.tfvars" --auto-approve

terraform destroy -var-file="prod.ec.tfvars" --auto-approve
```

## 참조

- [Terraform Registry - elastic](https://registry.terraform.io/namespaces/elastic)
  - [ec](https://registry.terraform.io/providers/elastic/ec/0.4.1)
  - [elasticstack](https://registry.terraform.io/providers/elastic/elasticstack/0.3.3)
- [Using Terraform with Elastic Cloud](https://www.elastic.co/blog/using-terraform-with-elastic-cloud)
- [Migrating data](https://www.elastic.co/guide/en/cloud/current/ec-migrating-data.html)
