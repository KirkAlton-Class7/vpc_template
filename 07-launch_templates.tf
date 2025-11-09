# Launch Template for Private Client A Auto Scaling Group
resource "aws_launch_template" "private_client_a_asg" {
  name = "private-client-a-asg-lt"
  image_id = data.aws_ami.amazon_linux_2023.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.private_asg.id]
  #key_name = "osaka-key"  # Replace with your key pair name
  user_data = filebase64("${path.module}/private_client_a_script.sh") # Custom script path for Client A (base64 encoding required for launch templates)

  ebs_optimized = true  
  instance_initiated_shutdown_behavior = "terminate"

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Private-Client-A-ASG-Instance"
    }
  }
}


# Launch Template for Private Client B Auto Scaling Group
resource "aws_launch_template" "private_client_b_asg" {
  name = "private-client-b-asg-lt"
  image_id = data.aws_ami.amazon_linux_2023.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.private_asg.id]
  #key_name = "osaka-key"  # Replace with your key pair name
  user_data = filebase64("${path.module}/private_client_b_script.sh") # Custom script path for Client B (base64 encoding required for launch templates)

  ebs_optimized = true
  instance_initiated_shutdown_behavior = "terminate"
  
monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Private-Client-B-ASG-Instance"
    }
  }
}


# Launch Template for Private Client C Auto Scaling Group
resource "aws_launch_template" "private_client_c_asg" {
  name = "private-client-c-asg-lt"
  image_id = data.aws_ami.amazon_linux_2023.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.private_asg.id]
  #key_name = "osaka-key"  # Replace with your key pair name
  
  ebs_optimized = true
  instance_initiated_shutdown_behavior = "terminate" 


  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "Private-Client-C-ASG-Instance"
    }
  }

    user_data = filebase64("${path.module}/private_client_c_script.sh") # Custom script path for Client C (base64 encoding required for launch templates)
}