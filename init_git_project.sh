#!/bin/bash
#init dir
dir=$(pwd)

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
