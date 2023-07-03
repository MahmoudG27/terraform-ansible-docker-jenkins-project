resource "aws_elasticache_subnet_group" "tf_redis_subnet" {
  name       = "my-redis-subnet"
  subnet_ids = var.subnet_ids_redis
}

resource "aws_elasticache_parameter_group" "tf_redis_parameter" {
  name   = "redis"
  family = "redis6.x"
  parameter {
    name  = "notify-keyspace-events"
    value = "KEA"
  }
}

resource "aws_elasticache_replication_group" "tf_redis" {
  replication_group_id       = "redis-rg"
  node_type                  = "cache.t2.micro"
  port                       = 6379
  engine_version             = "6.x"
  num_cache_clusters         = 1
  automatic_failover_enabled = true
  parameter_group_name       = aws_elasticache_parameter_group.tf_redis_parameter.name
  subnet_group_name          = aws_elasticache_subnet_group.tf_redis_subnet.name
  security_group_ids         = [aws_security_group.redis_sg.id]
}

resource "aws_security_group" "redis_sg" {
  vpc_id = var.vpc_id
  ingress {
    from_port   = 6379
    to_port     = 6379
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "null_resource" "output_redis" {
  provisioner "local-exec" {
    command = "echo 'REDIS_HOSTNAME='${aws_elasticache_replication_group.tf_redis.primary_endpoint_address}\n'REDIS_PORT=6379'  >> ./ENV-rds-redis"
  }
}