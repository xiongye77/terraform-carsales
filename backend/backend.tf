resource "aws_s3_bucket" "terraform-up-and-running-state-carsales" {
    bucket = "terraform-up-and-running-state-carsales"
    versioning {
      enabled = true
    }
    lifecycle {
      prevent_destroy = true
    }
}


resource "aws_dynamodb_table" "terraform-up-and-running-locks-carsales" {
  name = "terraform-up-and-running-locks-carsales"
  hash_key = "LockID"
  read_capacity = 5
  write_capacity = 5

  attribute {
    name = "LockID"
    type = "S"
  }
}

