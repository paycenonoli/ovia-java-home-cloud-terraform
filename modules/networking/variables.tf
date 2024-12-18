variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "vpc_tags" {
  default = {
    Name = "my-vpc"
  }
}

variable "pub_cidrs" {
  default = ["10.1.0.0/24", "10.1.1.0/24"]
}

variable "pri_cidrs" {
  default = ["10.1.2.0/24", "10.1.3.0/24"]
}
