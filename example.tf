#$export AWS_ACCESS_KEY_ID="anaccesskey"
#$export AWS_SECRET_ACCESS_KEY="asecretkey"
#$export AWS_DEFAULT_REGION="us-east-1"
provider "aws" {
}

variable "number_of_instances" {
  description = "Number of instances to create and attach to ELB"
  default     = 3
}

##############################################################
# Data sources to get VPC, subnets and security group details
##############################################################
data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "all" {
  vpc_id = "${data.aws_vpc.default.id}"
}

data "aws_security_group" "default" {
  vpc_id = "${data.aws_vpc.default.id}"
  name   = "default"
}

######
# ELB
######
module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "1.4.1"

  name = "elb-example"

  subnets         = ["${data.aws_subnet_ids.all.ids}"]
  security_groups = ["${data.aws_security_group.default.id}"]
  internal        = false

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "HTTP"
      lb_port           = "80"
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = "8080"
      instance_protocol = "HTTP"
      lb_port           = "8080"
      lb_protocol       = "HTTP"
    },
  ]

  health_check = [
    {
      target              = "HTTP:80/"
      interval            = 30
      healthy_threshold   = 2
      unhealthy_threshold = 2
      timeout             = 5
    },
  ]

  // Uncomment this section and set correct bucket name to enable access logging
  //  access_logs = [
  //    {
  //      bucket = "my-access-logs-bucket"
  //    },
  //  ]

  tags = {
    Owner       = "user"
    Environment = "dev"
  }
  # ELB attachments
  number_of_instances = "${var.number_of_instances}"
  instances           = ["${module.ec2_instances.id}"]
}

################
# EC2 instances
################
module "ec2_instances" {
  source = "terraform-aws-modules/ec2-instance/aws"

  instance_count = "${var.number_of_instances}"

  name                        = "my-app"
  ami                         = "ami-04169656fea786776"
  instance_type               = "t2.micro"
  vpc_security_group_ids      = ["${data.aws_security_group.default.id}"]
  subnet_id                   = "${element(data.aws_subnet_ids.all.ids, 0)}"
  associate_public_ip_address = true
}