#!/bin/bash
sudo yum update -y
sudo yum install git -y
git clone "https://github.com/jat01singh/devops-jatinder-singh-1.git"
cd devops-jatinder-singh-1
pip3 install -r requirements.txt
nohup python3 main.py &

