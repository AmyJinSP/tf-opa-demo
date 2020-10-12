  remote_state {
    backend = "s3"
    config = {
      bucket         = "terraform-amy-vpc-demo"
      key            = "${path_relative_to_include()}/terraform.tfstate"
      region         = "ap-southeast-2"
      encrypt        = true
      dynamodb_table = "terraform-lock-table-demo"
      profile        = "sandbox"
    }
  }
