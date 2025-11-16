PHONY: start-localstack
start-localstack:
	@echo "Starting LocalStack..."
	@docker run --rm -it -p 4566:4566 -p 4571:4571 --name localstack -d localstack/localstack

PHONY: infra
infra:
	@echo "Initializing and applying Terraform configuration..."
	@cd terraform && tofu init && tofu apply -auto-approve

PHONY: clean-terraform
clean-terraform:
	# remove the terraform state if present (TO BE ADDED)
	@rm terraform/terraform.tfstate 2>/dev/null || echo "No terraform state files to remove."
	@rm terraform/terraform.tfstate.backup 2>/dev/null || echo "No terraform backup state files to remove."
	@rm terraform/.terraform.lock.hcl 2>/dev/null || echo "No terraform lock file to remove."
	
PHONY: stop-all
stop-all:
	@echo "Stopping LocalStack..."
	@docker stop localstack || echo "LocalStack is not running."
