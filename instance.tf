resource "aws_security_group" "instance" {
  name = "terraform-example-instace"

  ingress{
   from_port = 8080
   to_port = 8080
   protocol = "tcp"
   cidr_blocks =["0.0.0.0/0"]
 }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks =["0.0.0.0/0"]
 }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
 }
  
}

resource "aws_instance" "example"{
	ami ="ami-0e2612a08262410c8"
	instance_type = "t2.micro"
	vpc_security_group_ids =["${aws_security_group.instance.id}"]

user_data = <<-EOF
		#!/bin/bash
		echo "Hello,World" > index.html
		nohup busybox httpd -f -p 8080 &
		EOF

tags = {
	Name = "terraform-example"
  }


}
