#!/bin/bash
projectUrl=`git remote -v |awk '{print $2}'|head -1`
echo "[INFO] the project url:"$projectUrl
protocol=${projectUrl:0:4}
echo "[INFO] the project protocol:"$protocol
if [ $protocol == "http" ];then
	open $projectUrl
else
	echo "[INFO] the project protocol is not http,so can not open."
fi
