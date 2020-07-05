#!/bin/bash
currentDir=$(pwd)
# 1.first to check this dir whether the git repo
# git remote -v 
if [ -d $currentDir/.git/  ];then
	# execute oo tool
	oo
else
	checkContain=`echo ${currentDir}|grep "pkg/mod/"|wc -l`	
	if [ $checkContain -le 0  ];then
		echo "[INFO] the currentDir:<${currentDir}> is not the go mod pkg dir."
		exit 1
	fi
	echo "[INFO]:the currentDir is:"${currentDir}
	# delete the prefix
	repoUrl=${currentDir#*/pkg/mod/}
	# delete the version
	repoUrl=${repoUrl%@*}
	# join the https:// and .git
	repoUrl="https://"${repoUrl}".git"
	echo -e  "[INFO]:library repo url:\n"${repoUrl}
	echo "[INFO]:open the reporistory url [in your brower]"
	open ${repoUrl}
fi
