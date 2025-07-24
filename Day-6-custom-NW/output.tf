output "eip_public_ip" {
  value = aws_eip.nat_ip.public_ip
}