#!/bin/bash/

FILENAME=$2
filetype_array=(".png" ".php" ".html" ".css" ".bak" ".zip" ".sh" ".md" ".txt" ".gz" ".mp3" ".docx" ".pdf" ".tar" ".doc" ".rtf" ".mp4" " ")
URL=$1
TOCHECK=$3

echo filename=$FILENAME url=$URL tocheck=$TOCHECK > valid_file_types.txt

for i in "${filetype_array[@]}"
do 	
	echo creating $FILENAME$i 
	
	touch $FILENAME$i
	STRING=$(curl -X POST -F file=@$FILENAME$i $URL|grep "$TOCHECK")
	echo  
	if [ "Extension not allowed</body>" != "$STRING" ]
	then
		echo $i is a valid filetype
		echo $i >> valid_file_types.txt
	fi
	rm $FILENAME$i


done
echo ------------------------------------------------------------- >> valid_file_types.txt	

