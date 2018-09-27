provider "aws" {
  region  = "eu-west-1"
  profile = "eol-development@exact"
}

data "aws_vpc" "default" {
  default = true
}

resource "aws_key_pair" "workshop" {
  key_name   = "workshop"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCuKZw4z7Jkb4hPkPs4YvAIIbwaXzi7xrP7xhuDroUw5l3i07N2ZHO/Q353ZM7ZaaYCYmEmPCh0a2DW5R0xC6YDGgg9/rInuzCPZqOHupW9dakCKxRgmuJ+IKtlWdcz2x32hW/nOvoDf0QH8y1M5AudpjICK1sgelYyn+65f9g0w9KcgfAJF7tko7bw1z36f6q8xpsQsrojp8+QKzZZ6oApXT9EyNBjT0ZkXmW+vV7GFMCv8Kcf03n8bgbO4iHbQzHMOm0uuIl0y9JWHPEBvMDHBrsM1Uu1oiUFE9PtIvz/QFi6tQ4yHvcRkXERTl31SanRG142S0ZKpOmGKdU/szifcn9uXsy4aFG3cb64L+9g4UBQ23wX51EMQkA2HRVj+V8yHtt5OjxP8rLZ4VVxAtv8rqNkSaPIthatnX29F2neaPswJwaqidNVAWg+88Swpy3IgTGkIg4SYuAg3JpLYRNbEN4bvd7KA5dsigLTL5c4X/ysWCddqQpkVuCAu/6sQ1RgnIGUy79lykbFsg+ZjBWlpMjxQW0YCcXlHYGpyH/mbJa9VMlqRcLf70dszGKkQok1MVgnbBNRyvV8T8G0HaoNWfjjDlxlGl/vygNKLLefjX8Ge5GJJUofdt8QS1XbSl24J1KNidYXUf34CgQX8/CinVRwY1Fn4C0F2qD5v6f8CQ== workshop@exact.com"
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
