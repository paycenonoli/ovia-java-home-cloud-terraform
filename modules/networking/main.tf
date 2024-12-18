resource "aws_vpc" "ovia-vpc" {
  cidr_block = var.vpc_cidr
  tags       = var.vpc_tags
}

# Create public subnets
resource "aws_subnet" "ovia-public" {
  count      = length(var.pub_cidrs) # N/B
  vpc_id     = aws_vpc.ovia-vpc.id
  cidr_block = var.pub_cidrs[count.index] # N/B
  availability_zone = data.aws_availability_zones.ovia-azs.names[count.index] # N/B
  tags = {
    Name = "Public-${count.index + 1}" # N/B
  }
}

# Create Internet Gateway
resource "aws_internet_gateway" "ovia-igw" {
  vpc_id = aws_vpc.ovia-vpc.id

  tags = {
    Name = "ovia-main"
  }
}

# Create public route table
resource "aws_route_table" "ovia-public-rt" {
  vpc_id = aws_vpc.ovia-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ovia-igw.id
  }

  tags = {
    Name = "public-router"
  }
}

# Associate route table with public subnets
resource "aws_route_table_association" "public-asso" {
  count = length(var.pub_cidrs) # N/B
  subnet_id      = aws_subnet.ovia-public.*.id[count.index] # N/B
  route_table_id = aws_route_table.ovia-public-rt.id
}

# Create private subnets
resource "aws_subnet" "ovia-private" {
  count      = length(var.pri_cidrs) # N/B
  vpc_id     = aws_vpc.ovia-vpc.id
  cidr_block = var.pri_cidrs[count.index] # N/B
  availability_zone = data.aws_availability_zones.ovia-azs.names[count.index] # N/B
  tags = {
    Name = "Private-${count.index + 1}" # N/B
  }
}

# Create NAT Gateway and configure the private route table to point to the NAT Gateway

 
