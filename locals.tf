locals {
    region = var.region_map[var.region_choice]
    azs = data.aws_availability_zones.available.names
}