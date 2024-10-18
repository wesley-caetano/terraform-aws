resource "aws_cloudwatch_metric_alarm" "cpu_high" {
  alarm_name          = "cpu_high_alarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "Alarme CPU ultrapassa 80%"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.meu_asg.name
  }
  unit = "Percent"

  alarm_actions = [aws_autoscaling_policy.scale_aumenta_policy.arn]
}

resource "aws_cloudwatch_metric_alarm" "cpu_low" {
  alarm_name          = "cpu_low_alarm"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "40"
  alarm_description   = "alarme CPU cai abaixo de 40%"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.meu_asg.name
  }
  unit = "Percent"

  alarm_actions = [aws_autoscaling_policy.scale_reduz_policy.arn]
}

resource "aws_cloudwatch_metric_alarm" "memcached_memory_high" {
  alarm_name          = "HighMemoryUsageInMemcached"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "BytesUsedForCache"
  namespace           = "AWS/ElastiCache"
  period              = "60"
  statistic           = "Average"
  threshold           = "100000000"
  alarm_description   = "Alarme para uso alto de memória no Memcached"
  dimensions = {
    CacheClusterId = aws_elasticache_cluster.my_elasticache.id
  }
  unit = "Bytes"

}

resource "aws_cloudwatch_metric_alarm" "rds_cpu_high" {
  alarm_name          = "HighRDSCPUUsage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/RDS"
  period              = "60"
  statistic           = "Average"
  threshold           = "80"
  alarm_description   = "Alarme para uso alto de CPU no RDS"
  dimensions = {
    DBInstanceIdentifier = aws_db_instance.mysql_db.id
  }
  unit = "Percent"

}

resource "aws_cloudwatch_metric_alarm" "instance_naosaudavel" {
  alarm_name          = "InstanceUnhealthyAlarm"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  period              = "60"
  statistic           = "Average"
  threshold           = "1"
  alarm_description   = "Alarme para instância EC2 com falha no health check"
  dimensions = {
    InstanceId = aws_instance.private_ec2.id
  }

}
