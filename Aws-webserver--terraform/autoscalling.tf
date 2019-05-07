resource "aws_launch_configuration" "milc" {
  image_id               = "${var.ami}"
  instance_type          = "t2.micro"
  security_groups        = ["${aws_security_group.misg.id}"]
  key_name               = "${var.key_path}"
  lifecycle {
    create_before_destroy = true
  }
}
data "aws_availability_zones" "all" {}
resource "aws_autoscaling_group" "miauto" {
  launch_configuration = "${aws_launch_configuration.milc.id}"
  availability_zones = ["${data.aws_availability_zones.all.names}"]
  min_size = 2
  max_size = 10
  load_balancers = ["${aws_elb.mielb.name}"]
  health_check_type = "ELB"
  tag {
    key = "Name"
    value = "terraform-asg-example"
    propagate_at_launch = true
  }
}
