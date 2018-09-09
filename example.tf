#$export AWS_ACCESS_KEY_ID="anaccesskey"
#$export AWS_SECRET_ACCESS_KEY="asecretkey"
#$export AWS_DEFAULT_REGION="us-east-1"

module "Ubuntu1"{
  source="./modules"
  instance_name="Ubuntu-Instance-1
}

module "Ubuntu2"{
  source="./modules"
  instance_name="Ubuntu-Instance-2
}

module "Ubuntu3"{
  source="./modules"
  instance_name="Ubuntu-Instance-3
}