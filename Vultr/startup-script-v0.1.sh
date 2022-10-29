#!/bin/bash

mkdir -p /root/.ssh
chmod 700 /root/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC4BhnDt00qe9O+ZKDjgBXkdr2nvei2+wGn4n7nIqTb7XJzh/QG7CkkrimQPYXDZRR4xvWw7FSaNvayGuue4F48/GUOqCpib4d5/NakiOym9ceTDM/7u4HNbWEJzfnAU6e/PG0wItetGp0Be45kGCkriZVfwsuSGm5csOkn8mPpEyhZcHr/C9A+yNVfRIFewc8z8g6DczuT1f42tdaeDQwY2mPBwjH13lmsJh3yYq9VGlhUbjwZSkYoT+FOG4IqY16Cwq2WF2QDkyOuPOwYu/XGL78fBRmQLlQxPleWD/8rSwN1g3l4I3IXkAAfj9kDIUxcev6XaLY9WFVX40q3OIPu9UsOMpR9tfGaZKIlEDxM4+ZbhpvBYG77uyykfRe+bBKKDkSJqhTuSkueXD6ddM/mGf7TaZD5cxD9HByc1fpVLKWXk2NrVW9KG9E0KJDSfSV203mdocjQlgEgDAsTtTnsoeHbXPv4rYzaOGI5nXFbL6C366Q1S8rpGJjspr9HCWc= paul@paul-MS-7C56' > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

# hopefully this runs after the cloud-init script
useradd -m -s /usr/bin/zsh -G sudo paul

DIR=/home/paul
mkdir "$DIR/.ssh"
cp /root/.ssh/authorized_keys "$DIR/.ssh"
chmod 700 "$DIR/.ssh"
chown -R paul:paul "$DIR/.ssh"
