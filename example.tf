#$export AWS_ACCESS_KEY_ID="anaccesskey"
#$export AWS_SECRET_ACCESS_KEY="asecretkey"
#$export AWS_DEFAULT_REGION="us-east-1"

module "ubuntuInstances"{
  source="./modules/createAwsUbuntu.tf"
}