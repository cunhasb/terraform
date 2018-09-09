resource "aws_instance" "ubuntu1604" {
  ami = "ami-04169656fea786776"
  instance_type="t2.micro"
  tags{
    Name="${var.instance_name}"
  }

}

variable "instance_name"{}