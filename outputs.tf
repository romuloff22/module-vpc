output "subnet_id" {
  description = "Id da Subnet"
  value       = aws_subnet.subnet-homo.id
}

output "security_group_id" {
  description = "ID do Security Group"
  value       = aws_security_group.security_group.id
}
