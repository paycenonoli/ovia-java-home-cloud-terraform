output "vpc_id" {
  value = aws_vpc.ovia-vpc.id
}

output "pub_sub_ids" {
  value = aws_subnet.ovia-public.*.id
}

output "pri_sub_ids" {
  value = aws_subnet.ovia-private.*.id
}
