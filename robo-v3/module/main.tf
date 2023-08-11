
resource "aws_instance" "instance" {

  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
  vpc_security_group_ids = var.security_groups

  tags = {
    Name = var.name
  }
}


resource "aws_route53_record" "record" {

  zone_id = var.zone_id
  name    = "${var.name}-dev.vyshu.online"
  type    = "A"
  ttl     = 30
  records = [aws_instance.instance.public_ip ]
}

resource null_resource "ansible" {
  depends_on = [
    aws_route53_record.record
  ]
  provisioner "local-exec" {
    command = <<EOF
cd /home/centos/robo-ansible-roles
git pull
sleep 30
ansible-playbook -i ${var.name}-dev.vyshu.online, main.yml -e "ansible_user=centos ansible_password=DevOps321 component_role=${var.name}"
EOF
  }
}





