output "vpc_id" {
  description = "ID of the lab vpc"
  value = aws_vpc.lab.id
}

output "subnet_id" {
  description = "ID of the lab subnet"
  value = aws_subnet.lab.id
}