resource "aws_internet_gateway" "my_internet_gate" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Internet_Gate"
  }
}

resource "aws_route_table" "rota_publica" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Rota_Publica"
  }
}

resource "aws_route" "rota_gate_net" {
  route_table_id         = aws_route_table.rota_publica.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.my_internet_gate.id
}

resource "aws_route_table_association" "associada_publica_a" {
  subnet_id      = aws_subnet.subnet_public_a.id
  route_table_id = aws_route_table.rota_publica.id
}

resource "aws_route_table_association" "associada_publica_b" {
  subnet_id      = aws_subnet.subnet_public_b.id
  route_table_id = aws_route_table.rota_publica.id
}

resource "aws_route_table_association" "associada_publica_vpc" {
  subnet_id      = aws_subnet.subnet_public_vpc.id
  route_table_id = aws_route_table.rota_publica.id
}