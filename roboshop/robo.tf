resource "aws_instance" "frontend" {
  ami           = "ami-03265a0778a880afb"
  instance_type = "t2.micro"
  vpc_security_group_ids = "sg-08aa5756a692da5db"

  tags = {
    Name = "frontend"
  }
}
resource "aws_route53_record" "frontend" {
  zone_id = "Z07187411N9MH0R0B9I00"
  name    = "frontend-dev.vyshu.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.frontend.public_ip]
}
