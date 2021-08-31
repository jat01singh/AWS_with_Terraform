#Creating ebs volume

resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = "us-east-1a"
  size              = "8"
  type              = "gp2"

  tags = {
    Name = "ebs-volume-webserver"
  }
}

resource "aws_volume_attachment" "ebs_volume_attachment" {
  device_name = "/dev/sdb"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.webserver.id
}

data "template_file" "init" {
  template = "${file("volume.sh")}"

  vars = {
    device_name = var.device_name
  }
}


#Creating ec2_instance 

resource "aws_instance" "webserver" {
  ami                    = "ami-0c2b8ca1dad447f8a"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.webserver_sg.id]
  subnet_id              = aws_subnet.subnet_1.id
  #User data passing through template rendering  
  user_data = data.template_file.init.rendered

  tags = {
    Name = "EBS with userdata"
  }
}

#Creating eip

resource "aws_eip" "eip" {
  instance = aws_instance.webserver.id
  vpc      = true
}

#Output the eip of the instance

output "public_ip" {
  description = "Contains the eip"
  value       = aws_eip.eip.public_ip
}

