resource "aws_instance" "web" {
    ami                     = var.ami_id
    instance_type           = var.web_instance_type 
    associate_public_ip_address = true
    vpc_security_group_ids  = [aws_security_group.sg.id]
    subnet_id               = aws_subnet.public_subnet.id
    root_block_device {
      volume_size = 8
      delete_on_termination = true
    }
    tags = {
      Name = "HelloWorld"
    }
    user_data = <<-EOF
        #!/bin/bash
        set -ex
        sudo yum update -y
        sudo amazon-linux-extras install docker -y
        sudo service docker start
        sudo usermod -a -G docker ec2-user
        sudo docker run -d -p 8080:80 tutum/hello-world
    EOF
}