#!/bin/bash
if [ $# -eq 0 ];then
	git status
	exit 0
fi

projectUrl=`git remote -v |awk '{print $2}'|head -1`
echo  -e "[INFO] the project url:\n"$projectUrl
echo $projectUrl |pbcopy
echo "[INFO] the project url is copyed in your pasteboard"
