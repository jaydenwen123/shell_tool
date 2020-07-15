#!/bin/bash

if [ $# -eq 0  ];then
        formatDate=`date "+%Y-%m-%d %H:%M:%S"`
        echo -e "[INFO] the format date:\n"${formatDate}
        exit 0
fi
timeStamp=$1
echo -e "[INFO] the timestamp is:\n${timeStamp}"
formatDate=`date -r "${timeStamp}" "+%Y-%m-%d %H:%M:%S"`
echo -e "[INFO] the format date:\n"${formatDate}

