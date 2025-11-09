# Outputs display important information after terraform apply

output "vpc_id" {
  description = "ID of the VPC"
  value       = aws_vpc.main.id
}
# output "availability_zones" {
#   description = "Availability zones used"
#   value       = tolist(data.aws_availability_zones.available.names)
# }

# Bastion Host Output
output "Bastion_Host_Details" {
  description = "Bastion Host Details"
  value = {
    name       = aws_instance.bastion_host.tags["Name"]
    subnet     = aws_instance.bastion_host.subnet_id
    public_ip  = aws_instance.bastion_host.public_ip
    private_ip = aws_instance.bastion_host.private_ip
    public_dns = aws_instance.bastion_host.public_dns
  }
}


# Public Client A Output
output "Public_Client_A_Details" {
  description = "Public Client A Details"
  value = {
    name       = aws_instance.public_client_a.tags["Name"]
    subnet     = aws_instance.public_client_a.subnet_id
    public_ip  = aws_instance.public_client_a.public_ip
    private_ip = aws_instance.public_client_a.private_ip
    public_dns = aws_instance.public_client_a.public_dns
  }
}

# Private Client A Output
output "Private_Client_A_Details" {
  description = "Private Client A Details"
  value = {
    name       = aws_instance.private_client_a.tags["Name"]
    subnet     = aws_instance.private_client_a.subnet_id
    private_ip = aws_instance.private_client_a.private_ip
  }
}

# Private Client B Output
output "Private_Client_B_Details" {
  description = "Private Client B Details"
  value = {
    name       = aws_instance.private_client_b.tags["Name"]
    subnet     = aws_instance.private_client_b.subnet_id
    private_ip = aws_instance.private_client_b.private_ip
  }
}

# Private Client C Output
output "Private_Cleint_C_Details" {
  description = "Private Client C Details"
  value = {
    name       = aws_instance.private_client_c.tags["Name"]
    subnet     = aws_instance.private_client_c.subnet_id
    private_ip = aws_instance.private_client_c.private_ip
  }
}
# # Private Client Mixed ASG Output
# output "aws_autoscaling_group_private_client_mixed_asg" {
#   description = "Private Client Mixed ASG Details"
#   value = {
#     Name       = aws_autoscaling_group.private_client_mixed_asg.tag["Name"]
#   }
# }


