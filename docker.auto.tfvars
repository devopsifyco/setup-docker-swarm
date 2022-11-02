# context auto.var
enabled     = true
namespace   = "devopsify"
stage       = "demo"
environment = "quannhm"
region      = "us-east-1"
#ASG
instance_type             = "t3.micro"
health_check_type         = "EC2"
wait_for_capacity_timeout = "25m"
max_size                  = 0
min_size                  = 0
desired_capacity          = 0
#VPC
cidr            = "10.99.0.0/18"
public_subnets  = ["10.99.0.0/24", "10.99.1.0/24", "10.99.2.0/24"]
private_subnets = ["10.99.3.0/24", "10.99.4.0/24", "10.99.5.0/24"]
egress_rules    = ["all-all"]
ingress_with_cidr_blocks = [
  {
    from_port   = 2377
    to_port     = 2377
    protocol    = 6
    description = "Service Swarm"
    cidr_blocks = "0.0.0.0/0"
  }
]
public_key = "ssh-rsa /+/k3NAy45JuBVe3AYg/N3QUZ+xh5xj6OyBlU+/ItJ51Ovgb7cP40VufH9ZE4RcfsK90fhuEVWwZZHv4pHpw6tfgCHJkLuNJxTPmit/5YWnF9Uve93RfYcuv2VUh9V4iuZWMjjWpNZMehLV1DNl67ob8HCFU/GY2L4KHxYumJWjJZUAGiNOlwWT0e5GOrMXqj3y9vt/HkLsV4Lh4z7lIGb4iSJvb0vlRTSEVowiaAKEbaYzQlHhF3t/"
