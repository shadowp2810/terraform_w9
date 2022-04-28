provider "aws" {
  region = "us-east-2"
}

module "db" {
  source       = "./db"
  server_names = ["mariadb", "mysql", "mssql"]
}

output "private_ips" {
  value = module.db.PrivateIP
}
