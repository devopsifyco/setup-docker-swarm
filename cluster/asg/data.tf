# -------------------------------------------------------
# AWS General Information
# -------------------------------------------------------
data "aws_availability_zones" "available" {
  state = "available"
}

# -------------------------------------------------------
# AMI Information
# -------------------------------------------------------
data "aws_ami" "amazon_linux_2" {
  most_recent = true

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }

  owners = ["amazon"]
}

data "aws_iam_instance_profile" "linux_profile" {
  name = var.instance_profile
}
