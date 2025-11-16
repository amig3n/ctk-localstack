terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = ">= 6.21.0"
        }
        
    }
    backend "local" {
        path = "terraform.tfstate"
    }
}

provider "aws" {
    region = "us-west-1"
    endpoints {
        sts = "http://localhost:4566"
        ec2 = "http://localhost:4566"
        s3 = "http://localhost:4566"
    }
}
