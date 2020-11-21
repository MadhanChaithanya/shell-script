#!/bin/bash
read -p "Enter The URL:" URL
wget $URL
if [ $? -eq 0 ]
then
echo "File Downloaded Sucessfully..."
ls -al
else
echo "Invalid URL"
fi