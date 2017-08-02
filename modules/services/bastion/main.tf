provider "aws" {
  region = "${var.aws_region}"
}

#############################
### ASG and Launch Config ###
#############################
resource "aws_autoscaling_group" "bastion" {
  vpc_zone_identifier       = ["${split(",", var.asg_subnets)}"]
  name_prefix               = "${var.asg_name}-"
  max_size                  = "${var.max_size}"
  min_size                  = "${var.min_size}"
  desired_capacity          = "${var.desired_capacity}"
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.config.name}"

  tag {
    key                 = "Name"
    value               = "tf-${var.asg_name}"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "config" {
  name            = "${var.config_name}"
  image_id        = "${data.aws_ami.amazon_linux.id}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${split(",", var.security_group_ids)}"]
  user_data       = "${file("${path.module}/user-data.sh")}"
  key_name        = "${var.key_name}"

  lifecycle {
    create_before_destroy = true
  }
}

