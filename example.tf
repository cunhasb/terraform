#$export AWS_ACCESS_KEY_ID="anaccesskey"
#$export AWS_SECRET_ACCESS_KEY="asecretkey"
#$export AWS_DEFAULT_REGION="us-east-1"

module "ubuntu-1" {
  source ="./modules/"
  instance_name="Ubuntu-1"
}


module "ubuntu-2" {
  source ="./modules/"
  instance_name="Ubuntu-2"
}


module "ubuntu-3" {
  source ="./modules/"
  instance_name="Ubuntu-3"
}


module "ubuntu-4" {
  source ="./modules/"
  instance_name="Ubuntu-4"
}