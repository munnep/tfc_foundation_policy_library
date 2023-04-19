provider "aws" {
  region = "eu-north-1"
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_ssh_from_all"
  description = "Allow ssh from all over the world"

  ingress {
    description      = "allow ssh world"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allows_ssh_all"
  }
}