resource "aws_route_table" "rota_privada" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "Rota_Privada"
  }
}

resource "aws_eip" "ip_elastico" {
  tags = {
    Name = "Ip_elastico"
  }
}

resource "aws_nat_gateway" "nat_gate" {
  allocation_id = aws_eip.ip_elastico.id
  subnet_id     = aws_subnet.subnet_public_a.id

  tags = {
    Name = "meu-nat-gate"
  }

}

resource "aws_route" "rota_nat_gate" {
  route_table_id         = aws_route_table.rota_privada.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_nat_gateway.nat_gate.id
}

resource "aws_route_table_association" "associada_privada_a" {
  subnet_id      = aws_subnet.subnet_priv_a.id
  route_table_id = aws_route_table.rota_privada.id
}

resource "aws_route_table_association" "associada_privada_b" {
  subnet_id      = aws_subnet.subnet_priv_b.id
  route_table_id = aws_route_table.rota_privada.id
}

resource "aws_route_table_association" "associada_privada_docker" {
  subnet_id      = aws_subnet.subnet_priv_docker.id
  route_table_id = aws_route_table.rota_privada.id
}
