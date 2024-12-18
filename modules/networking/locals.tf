locals {
  pub_sub_ids = aws_subnet.public.*.id
  pri_sub_ids = aws_subnet.private.*.id
}
