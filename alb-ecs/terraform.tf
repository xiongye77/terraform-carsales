terraform {
  backend "s3" {
    bucket         = "terraform-up-and-running-state-carsales-code"
    key            = "global/s3/terraform.tfstate"
    region         = "${var.region}"   
    dynamodb_table = "terraform-up-and-running-locks-carsales-code"
    encrypt        = true
  }
}
