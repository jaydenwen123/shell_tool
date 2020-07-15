#!/bin/bash
timeStamp=`date +%s`
echo  -e "[INFO] the current time stamp is(is copyed into the pasteboard):\n"${timeStamp}
echo ${timeStamp}|pbcopy
