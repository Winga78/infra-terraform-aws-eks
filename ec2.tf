resource "aws_instance" "esgi_instance" {
  ami           = "ami-0446057e5961dfab6"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnets[0].id
  tags = {
    Name = "EsgiBlog"
  }
 vpc_security_group_ids= [aws_security_group.allow_tls.id]
 associate_public_ip_address = true
  root_block_device {
   volume_type           = "gp2"
   volume_size           = "8"
   delete_on_termination = true
 }
}