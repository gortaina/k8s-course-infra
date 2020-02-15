provider "aws" {
  region = var.aws_region
}

# Master
resource "aws_instance" "k8s-master" {
  ami = var.aws_ami
  instance_type = var.instance_type
  count = var.instance_master_count

  # VPC
  subnet_id = aws_subnet.subnet-k8s-course.id

  # Security Groups
  vpc_security_group_ids = [aws_security_group.master-sg-k8s-course.id]

  # Public SSH-Key
  key_name = aws_key_pair.k8s-course-key-pair.id

  provisioner "file" {
    source = "provisioner.sh"
    destination = "/tmp/provisioner.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/provisioner.sh",
      "sudo /tmp/provisioner.sh"
    ]
  }

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file(var.private_key_path)
    host = aws_instance.k8s-master[count.index].public_ip
  }

  tags = {
    Name = "k8s-master"
  }
}

# Workers
resource "aws_instance" "k8s-workers" {
  ami = var.aws_ami
  instance_type = var.instance_type
  count = var.instance_worker_count

  # VPC
  subnet_id = aws_subnet.subnet-k8s-course.id

  # Security Groups
  vpc_security_group_ids = [aws_security_group.worker-sg-k8s-course.id]

  # Public SSH-Key
  key_name = aws_key_pair.k8s-course-key-pair.id

  provisioner "file" {
    source = "provisioner.sh"
    destination = "/tmp/provisioner.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/provisioner.sh",
      "sudo /tmp/provisioner.sh"
    ]
  }

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file(var.private_key_path)
    host = self.public_ip
  }

  tags = {
    Name = "k8s-worker"
  }
}

# Key Pair
resource "aws_key_pair" "k8s-course-key-pair" {
  key_name = "k8s-course-key-pair"
  public_key = file(var.public_key_path)
}
