.PHONY: all
all: clean init validate

.PHONY: clean
clean: destroy
	rm -rf .terraform
	rm -f *.tfstate
	rm -f .*.hcl

.PHONY: init
init:
	# 초기화
	terraform init

.PHONY: validate
validate:
	# 검증
	terraform validate

.PHONY: apply
apply:
	# 배포
	terraform apply -var-file="aws.tfvars" --auto-approve

.PHONY: upgrade
upgrade:
	# 업그레이드
	terraform init -upgrade
	terraform apply -var-file="aws.tfvars" --auto-approve

.PHONY: destroy
destroy:
	# 제거
	terraform destroy -var-file="aws.tfvars" --auto-approve
