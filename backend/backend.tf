resource "aws_s3_bucket" "terraform-up-and-running-state-carsales-code" {
    bucket = "terraform-up-and-running-state-carsales-code"
    versioning {
      enabled = true
    }
    lifecycle {
      prevent_destroy = false
    }
}


resource "aws_dynamodb_table" "terraform-up-and-running-locks-carsales-code" {
  name = "terraform-up-and-running-locks-carsales-code"
  hash_key = "LockID"
  read_capacity = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }
}

