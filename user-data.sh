#!/bin/bash

dnf install httpd -y

systemctl start httpd

systemctl enable httpd

echo "<h1>Welcome to Acme Retail Corporation</h1>" > /var/www/html/index.html


#!/bin/bash

dnf update -y

# Install Apache
dnf install httpd -y

systemctl start httpd
systemctl enable httpd


# Install Amazon SSM Agent
dnf install -y amazon-ssm-agent

systemctl enable amazon-ssm-agent
systemctl start amazon-ssm-agent
