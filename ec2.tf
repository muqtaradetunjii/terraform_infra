data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}


resource "aws_instance" "my_ec2" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"

  subnet_id = aws_subnet.public-subnet-1.id

  vpc_security_group_ids = [
    aws_security_group.ec2_security-group.id
  ]

  associate_public_ip_address = true

  iam_instance_profile = aws_iam_instance_profile.ec2_ssm_profile.name

  tags = {
    Name = "terraform-learning-ec2"

  }
  user_data = <<-EOF
#!/bin/bash

dnf install nginx -y

systemctl enable nginx
systemctl start nginx

cat > /usr/share/nginx/html/index.html <<'HTML'
<!DOCTYPE html>
<html>
<head>
    <title>My DevOps Project</title>
</head>
<body>
    <h1>Hello from Terraform!</h1>
    <h2>My automated AWS deployment</h2>
    <p>EC2 + Terraform + Nginx</p>
</body>
</html>
HTML
EOF

}


