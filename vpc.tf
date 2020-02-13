# VPC
resource "aws_vpc" "vpc-k8s-course" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  instance_tenancy = "default"
}

# Security Groups
resource "aws_security_group" "master-sg-k8s-course" {
  vpc_id = "${aws_vpc.vpc-k8s-course.id}"
  description = "SG master k8s"

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 6443
    to_port = 6443
    protocol = "tcp"
    cidr_blocks = ["${aws_vpc.vpc-k8s-course.cidr_block}"]
  }

  ingress {
    from_port = 2379
    to_port = 2380
    protocol = "tcp"
    cidr_blocks = ["${aws_vpc.vpc-k8s-course.cidr_block}"]
  }

  ingress {
    from_port = 10250
    to_port = 10250
    protocol = "tcp"
    cidr_blocks = ["${aws_vpc.vpc-k8s-course.cidr_block}"]
  }

  ingress {
    from_port = 10251
    to_port = 10251
    protocol = "tcp"
    cidr_blocks = ["${aws_vpc.vpc-k8s-course.cidr_block}"]
  }

  ingress {
    from_port = 10252
    to_port = 10252
    protocol = "tcp"
    cidr_blocks = ["${aws_vpc.vpc-k8s-course.cidr_block}"]
  }

  ingress {
    from_port = 10255
    to_port = 10255
    protocol = "tcp"
    cidr_blocks = ["${aws_vpc.vpc-k8s-course.cidr_block}"]
  }

  ingress {
    from_port = 6783
    to_port = 6783
    protocol = "tcp"
    cidr_blocks = ["${aws_vpc.vpc-k8s-course.cidr_block}"]
  }

  ingress {
    from_port = 6783
    to_port = 6784
    protocol = "udp"
    cidr_blocks = ["${aws_vpc.vpc-k8s-course.cidr_block}"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "worker-sg-k8s-course" {
  vpc_id = "${aws_vpc.vpc-k8s-course.id}"
  description = "SG worker k8s"

  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10250
    to_port = 10250
    protocol = "tcp"
    cidr_blocks = ["${aws_vpc.vpc-k8s-course.cidr_block}"]
  }

  ingress {
    from_port = 10255
    to_port = 10255
    protocol = "tcp"
    cidr_blocks = ["${aws_vpc.vpc-k8s-course.cidr_block}"]
  }

  ingress {
    from_port = 30000
    to_port = 32767
    protocol = "tcp"
    cidr_blocks = ["${aws_vpc.vpc-k8s-course.cidr_block}"]
  }

  ingress {
    from_port = 6783
    to_port = 6783
    protocol = "tcp"
    cidr_blocks = ["${aws_vpc.vpc-k8s-course.cidr_block}"]
  }

  ingress {
    from_port = 6783
    to_port = 6784
    protocol = "udp"
    cidr_blocks = ["${aws_vpc.vpc-k8s-course.cidr_block}"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}