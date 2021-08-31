# Description
##I have used Terraform as IaC. This terraform Snippet will create a

- VPC, Internet Gateway

- One Public Subnet associated to Public route table with Internet Gateway

- Security Group (Allowing traffic on ports 8888, 8080, 22, 80, 443)

- EC2 instance with EIP and EBS volume

###Terraform script has the necessary bootstrapping steps outlined to download - scm git - pip3 dependencies - starting the webserver

