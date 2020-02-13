  
#it can be any cloud provider AWS,GCP,AZURE
#considering AWS for this use case  
provider "aws" {
  # Region in which the resources and created or from which it gets imported
  region = "${var.region}"
  # Authenctication, acess_key and secret access of the user who has policies or roles 
  # attached to create the resources
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_instance" "101-goals-instance" {
  #specify the ami id,upon which the intance gets created there are various AMIs,
  #available per region and we create our own custom AMIs as well.
  ami="${var.ami}" 
  #there are various types of instances available that totally depends on our 
  #application requirements and cost involved,CPU utilzation and throughput
  instance_type="${var.instance_type}"
  #attaching newly created security group below to my instance
  security_groups = [
        "${aws_security_group.101-SG.id}"
    ]
  tags = {
    Name="101-goal-instance"
    } 
}

resource "aws_security_group" "101-SG" {
  name        = "101-SG"
  description = "Creating SG for 101-goal instance"
  #vpc id of the vpc attached to the SG
  vpc_id      = "${var.vpc_id}"

  ingress {
    # allowing inbound traffic to my instance
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = "${var.cidr_blocks}"
  }
  egress {
    # allowing outbound traffic from my instance
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = "${var.cidr_blocks}"
  }
   tags= {
         Name = "101-SG"
        }
}