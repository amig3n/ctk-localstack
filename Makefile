LOCALSTACK_VERSION ?= 4.10.0

PHONY: get-localstack
get-localstack:
	@echo "Pulling LocalStack Docker image version $(LOCALSTACK_VERSION)..."
	@docker pull localstack/localstack:$(LOCALSTACK_VERSION)

PHONY: start-localstack
start-localstack:
	@echo "Starting LocalStack..."
	@docker run --rm -it -p 4566:4566 -p 4571:4571 --name localstack -d localstack/localstack:$(LOCALSTACK_VERSION)

PHONY: infra
infra:
	@echo "Initializing and applying Terraform configuration..."
	@cd terraform && tofu init && tofu apply -auto-approve

PHONY: setup-all
setup-all: get-localstack start-localstack infra
	@echo "Setup complete."

PHONY: clean-terraform
clean-terraform:
	# remove the terraform state if present (TO BE ADDED)
	@rm terraform/terraform.tfstate 2>/dev/null || echo "No terraform state files to remove."
	@rm terraform/terraform.tfstate.backup 2>/dev/null || echo "No terraform backup state files to remove."
	@rm terraform/.terraform.lock.hcl 2>/dev/null || echo "No terraform lock file to remove."
	
PHONY: stop-all
stop-all: clean-terraform
	@echo "Stopping LocalStack..."
	@docker stop localstack 2>/dev/null || echo "LocalStack is not running."


