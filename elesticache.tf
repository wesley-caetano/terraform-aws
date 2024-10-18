resource "aws_elasticache_subnet_group" "subnet_elasticache" {
  name       = "subnet-elasticacheaws"
  subnet_ids = [aws_subnet.subnet_priv_a.id]
}

resource "aws_elasticache_cluster" "my_elasticache" {
  cluster_id         = "elasticache-prova"
  engine             = "memcached"
  node_type          = "cache.t2.micro"
  num_cache_nodes    = 1
  subnet_group_name  = aws_elasticache_subnet_group.subnet_elasticache.name
  security_group_ids = [aws_security_group.security_group_elesticache.id]
  port               = 11211
}
