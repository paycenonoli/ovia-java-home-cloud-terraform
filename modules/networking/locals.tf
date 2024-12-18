locals {
  pub_sub_ids = aws_subnet.ovia-public.*.id
  pri_sub_ids = aws_subnet.ovia-private.*.id
  azs = data.aws_availability_zones.ovia-azs.names
}
