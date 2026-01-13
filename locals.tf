locals {
    region = var.region_map[var.region_choice]
    azs = data.aws_availability_zones.available.names
    project = var.project_name
    trusted_ip = var.trusted_ip
}
