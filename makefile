

tf-plan:
	terragrunt plan

tf-apply-opacheck:
	./opa/check.sh

tf-apply:
	terragrunt  apply --auto-approve