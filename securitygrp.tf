resource "aws_security_group" "terraform-elbst-sg" {
  name        = "terraform-elbst-sg"
  description = "sg for elastic beanstalk"
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "terraform-bastian-sg" {
  name        = "terraform-bastian-sg"
  description = "sg for bastian host in public subnet"
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [var.MYIP]
  }

}

resource "aws_security_group" "terraform-prod-sg" {
  name        = "terraform-prod-sg"
  description = "sg for beanstalk instances"
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [aws_security_group.terraform-bastian-sg.id]
  }

}

resource "aws_security_group" "terraform-backend-sg" {
  name        = "terraform-backend-sg"
  description = "sg for rds,rabbitmq,elastic cache"
  vpc_id      = module.vpc.vpc_id

  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = [aws_security_group.terraform-elbst-sg.id]
  }

}

resource "aws_security_group_rule" "sg_allow_itself" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.terraform-backend-sg.id
  source_security_group_id = aws_security_group.terraform-backend-sg.id
}