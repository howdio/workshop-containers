provider "aws" {
  region  = "eu-west-1"
  profile = "eol-development@exact"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_key_pair" "workshop" {
  key_name   = "workshop"
  public_key = "${var.public_key}"
}

resource "aws_security_group" "workshop" {
  name        = "workshop"
  description = "Allow inbound traffic for workshop EC2 Instances"
  vpc_id      = "${data.aws_vpc.default.id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_blocks}"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_blocks}"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["${var.cidr_blocks}"]
  }
}

resource "aws_instance" "workshop" {
  count                  = "${var.instance_count}"
  ami                    = "ami-00035f41c82244dab"               # eu-west-1
  instance_type          = "t2.small"
  user_data              = "${local.user_data}"
  key_name               = "${aws_key_pair.workshop.key_name}"
  vpc_security_group_ids = ["${aws_security_group.workshop.id}"]

  tags {
    Name = "workshop-${count.index + 1}"
  }
}
