terraform {

  backend "s3" {

    bucket = "valarie-acme-terraform-state"

    key = "production/terraform.tfstate"

    region = "us-east-1"

    encrypt = true

    dynamodb_table = "terraform-locks"

  }

}
