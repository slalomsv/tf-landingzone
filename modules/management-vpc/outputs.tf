output "vpc_id" {
  value = "${aws_vpc.management.id}"
}

output "public_subnet_id" {
  value = "${aws_subnet.public.id}"
}

output "security_subnet_id" {
  value = "${aws_subnet.security.id}"
}

