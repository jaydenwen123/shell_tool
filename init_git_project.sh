#!/bin/bash
#init dir
dir=$(pwd)
# update the /etc/profile
source /etc/profile

#git config username
username=$GITUSERNAME
#git config email
email=$GITEMAIL

if [ $# -ge 1  ];then
	dir=$dir/$1
fi
cd $dir
git init . 
if [ $# -ge 2 ];then
	username=$INNERGITUSERNAME
	email=$INNERGITEMAIL
fi

git config user.name $username
git config user.email $email
echo "[INFO] git config username with $username"
echo "[INFO] git config email with $email"
