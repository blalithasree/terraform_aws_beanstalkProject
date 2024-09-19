terraform {
  backend "s3" {
    bucket = "beanstalk-terraform-state"
    key    = "tf/backend"
    region = "us-east-1"
  }
}