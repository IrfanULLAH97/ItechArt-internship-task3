provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


resource "aws_route_table_association" "public_1_rt_a" {
  subnet_id      = aws_subnet.some_public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_instance" "web_instance" {
  ami           = "ami-0533f2ba8a1995cf9"
  instance_type = "t2.nano"
  key_name      = "MyKeyPair"

  subnet_id                   = aws_subnet.some_public_subnet.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  associate_public_ip_address = true

  user_data = <<-EOF
  #!/bin/bash -ex

  amazon-linux-extras install nginx1 -y
  echo "<h1>Doing Good work, Keep it up !!! </h1>" >  /usr/share/nginx/html/index.html 
  systemctl enable nginx
  systemctl start nginx
  EOF

  tags = {
    "Name" : "Irfan"
  }
}