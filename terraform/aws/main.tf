resource "aws_instance" "app_server" {
  ami           = "ami-09dac21d1664bc313"  # official one
  # ami           = "ami-0ce99c18a68a1b23b"  # customized one
  instance_type = "t2.micro"
  key_name = var.key_name

  tags = {
    Name = "ScienceOS"
  }
  provisioner "local-exec" {
    command = "sh modify_ip.sh ${self.public_ip}"
  }
  metadata_options {
      http_tokens = "required"
  }
}
