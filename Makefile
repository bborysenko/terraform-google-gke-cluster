validate:
	terraform validate -var-file=tests/defaults.tfvars

plan:
	GOOGLE_PROJECT=rz-labs terraform plan -var-file=tests/defaults.tfvars

apply:
	GOOGLE_PROJECT=rz-labs terraform apply -var-file=tests/defaults.tfvars
