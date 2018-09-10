#$export AWS_ACCESS_KEY_ID="anaccesskey"
#$export AWS_SECRET_ACCESS_KEY="asecretkey"
#$export AWS_DEFAULT_REGION="us-east-1"

module "Ubuntu1"{
  source="./modules"
  instance_name="Ubuntu-1"
}


module "elb_example_complete" {
  source  = "terraform-aws-modules/elb/aws//examples/complete"
  version = "1.4.1"
}