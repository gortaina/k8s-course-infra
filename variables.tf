variable "aws_region" {
  default = "us-east-1"
}

variable "public_key_path" {
  default = "k8s-course-key.pub"
}

variable "private_key_path" {
  default = "k8s-course-key"
}

variable "instance_master_count" {
  default = "1"
}

variable "instance_worker_count" {
  default = "2"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "aws_ami" {
  default = "ami-08bc77a2c7eb2b1da"
}


