resource "aws_vpc" "main" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "kirk-demo-vpc"
  }
}

# data "aws_availability_zones" "available" {
#   availability_zone_ids = ["ap-northeast-3a", "ap-northeast-3b", "ap-northeast-3c"]
# }
