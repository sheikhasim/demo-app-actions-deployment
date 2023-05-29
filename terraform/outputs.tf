output "security_group__app_id"{
  value = aws_security_group.app.id
}

output "public_subnet_1_id"{
  value = aws_subnet.public_1.id
}

output "public_subnet_2_id"{
  value = aws_subnet.public_2.id
}

output "alb_public_dns"{
  value= "http://${aws_lb.this.dns_name}/"
}

output "image_version" {
  value = var.image_version
}
