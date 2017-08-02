provider "aws" {
  region = "${var.aws_region}"
}

#############################
### ASG and Launch Config ###
#############################
resource "aws_autoscaling_group" "ws_asg" {
  vpc_zone_identifier       = ["${split(",", var.asg_subnets)}"]
  name_prefix               = "${var.asg_name}-"
  max_size                  = "${var.max_size}"
  min_size                  = "${var.min_size}"
  desired_capacity          = "${var.desired_capacity}"
  health_check_grace_period = 300
  health_check_type         = "ELB"
  force_delete              = true
  launch_configuration      = "${aws_launch_configuration.config.name}"
  load_balancers            = ["${aws_elb.elb.id}"]

  tag {
    key                 = "Name"
    value               = "tf-${var.asg_name}"
    propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "config" {
  name_prefix     = "${var.lc_name}-"
  image_id        = "${data.aws_ami.amazon_linux.id}"
  instance_type   = "${var.instance_type}"
  security_groups = ["${split(",", var.lc_security_groups)}"]
  user_data       = "${file("${path.module}/user-data.sh")}"
  key_name        = "${var.key_name}"

  lifecycle {
    create_before_destroy = true
  }
}


###########
### ELB ###
###########
data "aws_availability_zones" "available" {}

resource "aws_elb" "elb" {
  name               = "${var.elb_name}"
  subnets            = ["${split(",", var.elb_subnets)}"]
  security_groups    = ["${split(",", var.elb_security_groups)}"]
  
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    target              = "TCP:80"
    healthy_threshold   = "${var.healthy_threshold}"
    unhealthy_threshold = "${var.unhealthy_threshold}"
    timeout             = "${var.health_timeout}"
    interval            = "${var.health_interval}"
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
  
  tags {
    Name = "tf-${var.elb_name}"
  }
}

