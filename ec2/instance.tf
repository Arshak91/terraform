
variable "private_key_path" {
  type    = string
  default = "./../../../../Downloads/virginia.pem"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "ami_id" {
  type    = string
  default = "ami-007855ac798b5175e"
}
variable "name" {
  type    = string
  default = "Test"
}

# Create an EC2 instance
resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.web.id
  vpc_security_group_ids = [aws_security_group.web.id]
  key_name      = "virginia"
  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
    inline = [
      "sudo apt update",
      "sudo apt install nginx -y",
      "sudo systemctl enable nginx",

      "sudo apt install openjdk-11-jdk -y",
      "sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null",
      "sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null",
      "sudo apt update",
      "sudo apt install jenkins -y",
      "sudo systemctl start jenkins",
      "sudo systemctl enable jenkins"
    ]
  }
  tags = {
    Name = "${var.name}-Instance"
  }
}

output "aws_instance" {
  value = aws_instance.web
}