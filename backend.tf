provider "aws" {
  region = "eu-west-3"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket = "devops-infra-1320-bucket"

  tags = {
    Name = "devops-infra-1320-bucket"
  }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name         = "your-dynamodb-lock-table"
  billing_mode = "PAY_PER_REQUEST"  # Switch to PAY_PER_REQUEST

  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform State Lock Table"
  }
}


