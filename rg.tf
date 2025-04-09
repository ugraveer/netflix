terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.0"
        }
    }
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_resourcegroups_group" "name" {
  
    name     = "netflix-rg"
    tags     = { Name = "netflix-rg" }
    resource_query {
        query = jsonencode({
        ResourceTypeFilters = ["AWS::AllSupported"]
        TagFilters         = [{ Key = "Name", Values = ["netflix"] }]
        })
    }
}
