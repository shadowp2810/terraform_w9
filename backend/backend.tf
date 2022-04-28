terraform {
  backend "s3" {
    key        = "terraform/tfstate.tfstate"
    bucket     = "pp-remote-backend-2022"
    region     = "us-east-2"
    access_key = "your_access_key"
    secret_key = "your_secret_key"
  }
}
