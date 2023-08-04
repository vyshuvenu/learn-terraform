resource "aws_instance" "frontend" {
  ami           = ami-03265a0778a880afb
  instance_type = "t3.micro"
  vpc_security_group_ids = [ "sg-0af3e5a83f971329a" ]
  tags = {
    Name = "frontend"
  }
}
resource "aws_route53_record" "frontend" {
zone_id = Z02452941A9F
name    = "frontend.vyshu.online"
type    = "A"
ttl     = 30
records = [aws_instance.frontend.public_ip]
}