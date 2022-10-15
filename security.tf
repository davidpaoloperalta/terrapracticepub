resource "aws_security_group" "sg" {
    name        = "${var.project}-web-sg"
    description = "Allow inbound traffic from the world"
    vpc_id      =  aws_vpc.vpc.id

    ingress {
        description     = "web access from the world"
        from_port       = 8080
        to_port         = 8080
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    egress {
        description     = "access to the world"
        from_port       = 0
        to_port         = 65535
        protocol        = "tcp"
        cidr_blocks     = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

}