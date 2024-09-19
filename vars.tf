variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMI" {
  type = map(any)
  default = {

    us-east-1 = "ami-0e86e20dae9224db8"
  }
}
variable "PRIV_KEY_PATH" {
  default = "lalitha"
}

variable "PUB_KEY_PATH" {
  default = "lalitha.pub"
}

variable "MYIP" {
  default = "24.88.36.69/32"
}

variable "RMQUSER" {
  default = "lallirmq"
}

variable "RMQPASS" {
  default = "admin@123"
}

variable "DBNAME" {
  default = "accounts"
}

variable "DBUSER" {
  default = "lallirmq"
}

variable "DBPASS" {
  default = "admin@123"
}

variable "INSTANCE_COUNT" {
  default = "1"
}

variable "VPC_NAME" {
  default = "bulls-VPC"
}

variable "VPC_CIDR" {
  default = "172.0.0.0/16"
}
variable "PUBSUB1_CIDR" {
  default = "172.0.1.0/24"
}
variable "PUBSUB2_CIDR" {
  default = "172.0.2.0/24"
}
variable "PUBSUB3_CIDR" {
  default = "172.0.3.0/24"
}

variable "PRIVSUB1_CIDR" {
  default = "172.0.4.0/24"
}
variable "PRIVSUB2_CIDR" {
  default = "172.0.5.0/24"
}

variable "PRIVSUB3_CIDR" {
  default = "172.0.6.0/24"
}




variable "ZONE1" {
  default = "us-east-1a"
}
variable "ZONE2" {
  default = "us-east-1b"
}
variable "ZONE3" {
  default = "us-east-1c"
}