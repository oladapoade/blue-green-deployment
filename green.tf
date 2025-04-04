resource "aws_security_group" "green_sg" {
  name        = "green-env-sg"
  description = "Security group for Green EC2"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "green-env-sg"
  }
}

resource "aws_instance" "green_instance" {
  ami                         = "ami-0c94855ba95c71c99" # Amazon Linux 2 in us-east-1
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet_2.id
  associate_public_ip_address = true
  key_name                    = "oladapo-key"
  security_groups             = [aws_security_group.green_sg.id]

  tags = {
    Name = "green-environment-instance"
  }
}

