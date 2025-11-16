By Andrzej Kopec (amig3n)

This are my configuration for running localstack for ctk development.

# Prerequisites

- docker
- make
- localstack (installed via docker)
- awscli (configured to use localstack)
- terraform

# Setting it all up
Just use `make setup-all` to set up localstack with all the required services and resources.

# Cleaning up
`make stop-all` will stop and remove the localstack container, with the terraform state files.
Terraform cache will remain
