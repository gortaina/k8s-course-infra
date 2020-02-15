resource "aws_subnet" "subnet-k8s-course" {
  vpc_id = aws_vpc.vpc-k8s-course.id
  cidr_block = "172.100.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone = "us-east-1a"

  tags = {
    Name = "subnet-k8s-course"
  }
}

resource "aws_internet_gateway" "igw-k8s-course" {
  vpc_id = aws_vpc.vpc-k8s-course.id

  tags = {
    Name = "igw-k8s-course"
  }
}

resource "aws_route_table" "rtb-k8s-course" {
  vpc_id = aws_vpc.vpc-k8s-course.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-k8s-course.id
  }

  tags = {
    Name = "rtb-k8s-course"
  }
}

resource "aws_route_table_association" "public-subnet-1-k8s-course" {
  subnet_id = aws_subnet.subnet-k8s-course.id
  route_table_id = aws_route_table.rtb-k8s-course.id
}