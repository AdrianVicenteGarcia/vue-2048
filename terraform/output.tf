output "instance_id" {
  description = "ID of the instance"
  value       = aws_instance.web[*].id
}
output "instance_ip" {
  description = "ID of the instance"
  value       = aws_instance.web[*].public_ip
}
