provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "insecure_sg" {
  name        = "insecure-sg"
  description = "Allows all traffic (insecure)"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # ❌ Opens all traffic from anywhere
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # ❌ Allows unrestricted outbound traffic
  }
}

resource "aws_s3_bucket" "public_bucket" {
  bucket = "insecure-public-bucket"

  acl    = "public-read"  # ❌ Publicly accessible bucket

  versioning {
    enabled = false  # ❌ No versioning (risk of data loss)
  }
}
