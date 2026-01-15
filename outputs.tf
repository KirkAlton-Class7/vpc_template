output "application" {
  description = "Application"
  value = local.application
}

output "environment" {
  description = "Environment"
  value = local.environment
}

output "region_choice" {
  description = "Region choice (number)"
  value = var.region_choice
}

output "region" {
  description = "Region (name)"
  value = local.region
}

output "vpc_info" {
  description = "VPC ID, Name and CIDR block"
  value = {
    id   = aws_vpc.main.id
    name = aws_vpc.main.tags["Name"]
    cidr = aws_vpc.main.cidr_block
    }
}

output "availability_zones" {
  description = "Avialability Zones"
  value = data.aws_availability_zones.available.names
  }

output "trusted_ip" {
  description = "Trusted IP address for SSH access"
  value = local.trusted_ip
}

output "rds_subnets" {
  value = aws_db_subnet_group.my_subnet_group.subnet_ids
}