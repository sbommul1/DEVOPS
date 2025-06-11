output "aws_instance_public_ip" {
    value = aws_instance.my-terraform-server.public_ip
}