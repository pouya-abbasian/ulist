#!/bin/bash
echo 'wellcome !'
read -p "Please Enter Youtube Link ~> " page
url='/tmp/'$RANDOM'.html'
wget -O $url $page
if [[ $? == "0" ]];then
	num=`cat $url | grep watch?v | sed 's/watch?v/\nwatch?v/g' | sed 's/webPageType/\n/g' |sed 's/\\u/\n/g' | grep watch?v= | sed 's/watch?v=//g' | sed 's/&/\n/g' | grep -v amp | awk {'print $1'} | grep -v } | sed 's/"/d/g' | grep -v ';' | sort -u | sed 's/^/youtube.com\/watch?v=/g' | wc -l`
	echo "Your List Already, Theyer "$num"s : "
	cat $url | grep watch?v | sed 's/watch?v/\nwatch?v/g' | sed 's/webPageType/\n/g' |sed 's/\\u/\n/g' | grep watch?v= | sed 's/watch?v=//g' | sed 's/&/\n/g' | grep -v amp | awk {'print $1'} | grep -v } | sed 's/"/d/g' | sort -u | sed 's/^/youtube.com\/watch?v=/g' | grep -v ';' 
	echo $output
	read -p "Do you want save in any file ? [ y/n ] " yesorno
	if [[ "$yesorno" == "" ]] ||  [[ "$yesorno" == "y" ]] ||  [[ "$yesorno" == "Y" ]] ; then
		read -p "Enter file name ~> " filename
		cat $url | grep watch?v | sed 's/watch?v/\nwatch?v/g'   | sed 's/webPageType/\n/g' |sed 's/\\u/\n/g' | grep watch?v= | sed 's/watch?v=//g' | sed 's/&/\n/g' |grep -v amp | awk {'print $1'} | grep -v } | sed 's/"/d/g' | sed 's/^/youtube.com\/watch?v=/g' | grep -v ';' | sort -u > $filename
	else
		echo 'ok bye!'
	fi
else
	exit 1
fi
