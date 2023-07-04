output "rds_id" {
  value = aws_db_instance.tf_rds.id
}

output "redis_id" {
  value = aws_elasticache_replication_group.tf_redis.id
}