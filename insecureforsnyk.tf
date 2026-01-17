# insecure.tf
resource "aws_security_group" "bad_sg" {
  name        = "open-all"
  description = "Allow all inbound traffic"
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]  # 🔴 Unrestricted access
  }
}

resource "aws_s3_bucket" "bad_bucket" {
  bucket = "insecure-bucket"
  acl    = "public-read"  # 🔴 Public access

  versioning {
    enabled = false  # 🟠 No versioning
  }
}
