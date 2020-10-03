# terraform

# === aws amis
# - https://wiki.debian.org/cloud/amazonec2image/stretch
# - eu-west-2 debian stretch ami-0ef10a4062f24d89d

# === structure
# rename this to terraform/main.tf
# recommended basic files structure for a tf project
# - main.tf
# - outputs.tf
# - variables.tf

# === provider settings

terraform {
  required_version = ">=0.12.0"
  required_providers {
    aws = ">= 2.7.0"
  }
}

provider "aws" {
  version = "~> 2.0"

  # available regions supporting eks and fargate
  # - region ireland "eu-west-1"
  # - region london "eu-west-2"
  # - region stockholm "eu-north-1"
  # - region frankfurt "eu-central-1"

  region = "eu-west-1"

  # the region setting above overrides env variable - AWS_DEFAULT_REGION
  #
  # for deployment to work, you MUST have these following environment variables set via :
  # - export AWS_ACCESS_KEY_ID="an-access-key"
  # - export AWS_SECRET_ACCESS_KEY="a-secret-key"
}

# === service networks vpc subnet gateway

resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  # default_security_group_id = "${aws_security_group.allow_tls.id}"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id = "${aws_vpc.main.id}"
  # cidr_block = "10.0.1.0/24"
  cidr_block        = "${cidrsubnet(aws_vpc.main.cidr_block, 3, 1)}"
  availability_zone = "eu-central-1a"

  tags = {
    Name = "main-subnet"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags = {
    Name = "main-gateway"
  }
}

resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.main.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.main.id}"
  }

  tags = {
    Name = "main-routetable"
  }
}

resource "aws_route_table_association" "subnet-association" {
  subnet_id      = "${aws_subnet.main.id}"
  route_table_id = "${aws_route_table.main.id}"
}

# === service network security

resource "aws_security_group" "allow-all-tls" {
  name        = "${local.namespace}-allow-all-tls"
  description = "allow tls inbound traffic"
  vpc_id      = "${aws_vpc.main.id}"
  # vpc_id      = "${module.vpc.vpc_id}"

  ingress {
    # TLS - default ssh
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # TLS - http to nginx
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # TLS - docker registry
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # TLS - docker swarm default port
    from_port   = 2377
    to_port     = 2377
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # TLS - docker machine default port
    from_port   = 2376
    to_port     = 2376
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # TLS - docker stack visualiser
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # TLS - docker base instance
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    # TLS - docker base instance
    from_port   = 8082
    to_port     = 8082
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_iam_role" "instance" {
  description = "role used for example"
  name        = "example_role"
}

resource "aws_iam_role" "instance" {
  name_prefix        = "ex-logstash-worker"
  assume_role_policy = <<-EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# === resource amis

data "aws_ami" "aws-docker" {
  most_recent = true
  owners      = ["amazon"]

  # user = ec2-user
  filter {
    name   = "image-id"
    values = ["ami-026d3b3672c6e7b66"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ami" "ubuntu-16" {
  most_recent = true
  # owners = ["amazon"]
  owners = ["099720109477"] # Canonical
  # user = ubuntu

  filter {
    name   = "image-id"
    values = ["ami-0085d4f8878cddc81"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# === service networks

resource "aws_alb" "base" {
  name = "${local.namespace}-base"

  # security_groups = [
  #   "${aws_security_group.myproj-be.id}",
  # ]

  subnets      = ["${data.aws_subnet_ids.public.ids}"]
  tags         = "${local.common_tags}"
  idle_timeout = 300

  access_logs {
    bucket  = "${aws_s3_bucket.access_logs.bucket}"
    prefix  = "web"
    enabled = true
  }
}

# === service logging bucket

resource "aws_s3_bucket" "log_bucket" {
  bucket = "${local.namespace}-logs-bucket"
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket" "base_bucket" {
  bucket = "${local.namespace}-base-bucket"
  acl    = "private"

  logging {
    target_bucket = "${aws_s3_bucket.log_bucket.id}"
    target_prefix = "log/"
  }
}

# === service - dummy instance

resource "aws_instance" "dummy" {
  ami                         = "${data.aws_ami.ubuntu-16.id}"
  instance_type               = "t2.micro"
  key_name                    = "devkeypair"
  subnet_id                   = "${aws_subnet.main.id}"
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.allow-all-tls.id}"]

  provisioner "file" {
    connection {
      type = "ssh"
      # host = self.public_dns
      host = self.public_ip
      user = "ubuntu"
      # agent       = true
      private_key = "${file(var.private_key_path)}"
    }

    source = "terraform-helpers/init.sh"
    # needs to be /tmp or /var/tmp due to guid/root access issues. mv from the using remote-exec
    destination = "/tmp/init.sh"
  }

  provisioner "remote-exec" {
    connection {
      type = "ssh"
      # host = self.public_dns
      host = self.public_ip
      user = "ubuntu"
      # agent       = true
      private_key = "${file(var.private_key_path)}"
    }

    inline = [
      "echo '=== deployment start ==='",
      "echo '==> env var' && env",
      "echo '==> running bootstrap init script'",
      "chmod +x /tmp/init.sh",
      "/tmp/init.sh #args",
      "echo '=== deployment complete ==='",
    ]
  }
}

output "instance_public_dns_dummy-base" {
  value       = aws_instance.dummy.public_dns
  description = "the dns name of dummy instance"
}

output "instance_public_ip_dummy-base" {
  value       = aws_instance.dummy.public_ip
  description = "the dns name of dummy instance"
}

resource "aws_lb" "dummy" {
  name               = "${local.namespace}-dummy"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.allow-all-tls.id}"]
  subnets            = ["${aws_subnet.main.*.id}"]

  enable_deletion_protection = true

  access_logs {
    bucket  = "${aws_s3_bucket.log_bucket.id}"
    prefix  = "example-lb"
    enabled = true
  }

  tags = "${merge(
    local.common_tags,
    map(
      "Service", "dummy",
    )
  )}"
}

resource "aws_lb_target_group" "dummy" {
  name                 = "${local.namespace}-dummy"
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = "${module.vpc.vpc_id}"
  deregistration_delay = 60
  tags                 = "${local.common_tags}"
}

# === service image repository

resource "aws_ecr_repository" "base" {
  # actual aws reference name of the resource
  # for future use of deploying to a container repository
  name = "base"
}

# === general outputs ===

output "instance_docker_registry" {
  value       = "${aws_instance.dummy.public_dns}:5000"
  description = "instance - docker registry"
}

# === variables ===

variable "http_port" {
  description = "port used for http requests"
  default     = "80"
}

locals {
  common_tags = {
    environment = "develop",
    project     = "example",
  }
  namespace = "example"
  owner     = "devops"
}

