
resource "aws_autoscaling_group" "meu_asg" {

  launch_template {
    id      = aws_launch_template.my_launch_template.id
    version = "$Default"
  }
  vpc_zone_identifier = [aws_subnet.subnet_priv_a.id, aws_subnet.subnet_priv_b.id]
  desired_capacity    = 2
  max_size            = 4
  min_size            = 2

  target_group_arns = [aws_lb_target_group.my_target_group.arn]


  tag {
    key                 = "Name"
    value               = "MyAutoScalingInstancia"
    propagate_at_launch = true
  }


  health_check_type         = "ELB"
  health_check_grace_period = 300


}

resource "aws_autoscaling_policy" "scale_aumenta_policy" {
  name                   = "scale_aumenta_policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.meu_asg.name
}

resource "aws_autoscaling_policy" "scale_reduz_policy" {
  name                   = "scale_reduz_policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.meu_asg.name
}





