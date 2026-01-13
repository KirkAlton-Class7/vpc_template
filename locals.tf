locals {
    
    project = var.project_name
    trusted_ip = var.trusted_ip

    region = var.region_map[var.region_choice]
    azs = data.aws_availability_zones.available.names
    
    # Shared random index
    subnet_index = random_integer.subnet_picker.result

    public_subnets = [
        aws_subnet.public_a.id,
        aws_subnet.public_b.id,
        aws_subnet.public_c.id
        ]

    # Assigns random subnet from the list using shared random index
    random_public_subnet = local.public_subnets[local.subnet_index]

    
    private_egress_subnets = [
        aws_subnet.private_egress_a.id,
        aws_subnet.private_egress_b.id,
        aws_subnet.private_egress_c.id
        ]
    
    random_private_egress_subnet = local.private_egress_subnets[local.subnet_index]
    
    private_data_subnets = [
        aws_subnet.private_data_a.id,
        aws_subnet.private_data_b.id,
        aws_subnet.private_data_c.id
        ]
    
    random_private_data_subnet = local.private_data_subnets[local.subnet_index]

    ec2_sg = aws_security_group.ec2_public_app.id
    
    private_db_sg = aws_security_group.private_db.id
}


