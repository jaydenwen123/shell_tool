#!/bin/bash
echo "[INFO] git status"
git status
echo "[INFO] exec git add ."
git add .
git status
echo "[INFO] exec git commit -m $1"
git commit -m "$1"
if [ $# -lt 2 ];then
	echo "[INFO] git push origin master"
	git push origin master
fi
