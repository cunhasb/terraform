resource "aws_instance" ubuntu1604" {
  count=4
  ami = "ami-04169656fea786776"
  instance_type="t2-micro"
  tags{
    Name="UbuntuInstance"
  }

}