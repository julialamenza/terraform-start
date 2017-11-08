provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "exemple" {
  ami = "ami-40d28157"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
              #!/bin/bash
              echo "Helloww" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF
  tags {
    Name = "terraform-example"
  }

}
