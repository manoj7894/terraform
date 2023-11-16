# provider details
provider "aws" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
}

# Create an First EC2 instance
resource "aws_instance" "example_instance" {
  ami                         = var.ami           # Change to your desired AMI ID
  instance_type               = var.instance_type # Change to your desired instance type
  key_name                    = var.key_name # Change to your key pair name

  tags = {
    Name = "Example-1"
  }
}
