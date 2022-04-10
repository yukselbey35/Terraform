#Create and bootstrap webserver
resource "aws_instance" "webserver" {
  ami                         = data.aws_ssm_parameter.webserver-ami.value
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.webserver-key.key_name
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install httpd && sudo systemctl start httpd",
      "echo '<h1><center>My Test Website With Help From Terraform Provisioner</center></h1>' > index.html",
      "sudo mv index.html /var/www/html/"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }
  tags = {
    Name = "webserver"
  }
}

/*
The remote-exec keyword tells us that this is a remote provisioner, which invokes a script on a
 remote resource after it is created.
The provisioner is using the parameters configured in the embedded connection block to 
connect to the AWS EC2 instance being created.
The provisioner will then issue the commands configured in the inline block to install
 Apache webserver on CentOS through the yum package manager, start up the Apache server, 
 create a single web page called My Test Website With Help From Terraform Provisioner 
 as an index.html file, and move that file into the data directory of the webserver to be served out 
 globally.
*/