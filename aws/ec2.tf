resource "aws_instance" "app_instance" {
  instance_type     = "t2.micro"
  availability_zone = "${var.region}c"
  # AMI Catalog: Ubuntu Server 22.04 LTS (HVM), SSD Volume Type, 64비트(x86)
  ami               = "ami-04cebc8d6c4f297a3"

  tags = {
    Name = "test-instance"
  }

  user_data = <<-EOF
  #!/bin/bash
  echo "Hello, World" > index.html
  nohup busybox httpd -f -p "${var.port}" &
  EOF
}

# resource "aws_key_pair" "name" {
  
# }
