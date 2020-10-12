	#!/bin/bash
	terragrunt plan --out tfplan.binary
	terraform show -json tfplan.binary > tfplan.json
    output=$(opa eval --format pretty  --data ./opa/terraform.rego --input tfplan.json "data.terraform.analysis.authz")
	if [ ${output} ]; then
		echo "change contains subnet resource type, cannot proceed!"
	else
		echo "apply change"
	    terragrunt  apply --auto-approve
	fi