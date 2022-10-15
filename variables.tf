variable "region" {
    description = "AWS deployment region"
}

variable "project" {
    description = "Project name"
}

variable "vpc_cidr" {
    description = "VPC CIDR block"
}

variable "public_subnet_cidr" {
    description = "Public subnet CIDR block"
}

variable "availability_zone" {
    description = "AZ"
}

variable "ami_id" {
    description = "Instance AMI"
}

variable "web_instance_type" {
    description = "Instance type"
}