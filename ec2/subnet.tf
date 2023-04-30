
# Create a subnet within the VPC
resource "aws_subnet" "web" {
  vpc_id     = aws_vpc.web.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  # Enable auto-assign public IP addresses for instances launched in this subnet
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-Subnet"
  }
}