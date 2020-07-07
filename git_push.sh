#!/bin/bash
# current branch
branch=`git branch |grep "*"|awk '{print $2}'`

# if there is no param,then execute git push opeartion
if [  $# -eq 0   ];then
	#read -p "please input the pushed branch,the default branch is master:" -t 30 branch
	#if [  ${#branch} -eq 0  ];then
	#	branch="master"
	#fi
	echo "[INFO] execute action:<git push origin ${branch}>"
	git push origin $branch
	exit 0
fi

echo "[INFO] git status"
git status
echo "[INFO] exec git add ."
git add .
git status
echo "[INFO] exec git commit -m $1"
git commit -m "$1"
if [ $# -lt 2 ];then
	echo "[INFO] git push origin ${branch}"
	git push origin ${branch}
fi
