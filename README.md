# tf opa demo

1. vpc module is under modules-vpc folder
2. opa policy is under opa folder

# how to deploy
makefile is used for simplizing the deployment
1. make sure you have login aws account and the profile is updated based on your setup(both terragrunt.hcl and provider.tf):
```
 profile = "sandbox"
```
2. to run opa check before deploy:
```
make tf-apply-opacheck
```
change will be deny if the resource contains subnet
3. to deploy without opa check:
```
make tf-apply
```
this will deploy vpc/subnet as well as rds database

# AWS config:
the aws config cloudformation is under opa/config.yaml file
I don't quite get this requirements. The config rule mentioned in the requirements just check if database protection is enable or not, further remediation is required to setup in order to protect databases. so I only put AWS config in cloudformation.