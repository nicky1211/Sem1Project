#!/bin/bash
set -x
########################################################################
# Author      : Manick                                                 #
# Date        : 21st Aug 2016 21:22     		               #
# Script Name : Curl Alexa					       #
# Reason      : To get the top 200 sites visited in India	       #	
########################################################################


# cURL the Alexa website url and save them to respective files

for i in {0..7}; do
  curl -# -o allpages_$i.html "http://www.alexa.com/topsites/countries;$i/IN"
done

#Read the files written by the above and get the website names
cat allpages* | grep "site-listing" | sed 's/<\/\?[^>]\+>//g' | tr "\t" " " | tr -s " " > List_of_Top_200_Websites.csv


#Remove the Serial Number from the website name
cat List_of_Top_200_Websites.csv | tr -d '0123456789' > Websites_Format_Issue.txt
sed -i 's// /g' Websites_Format_Issue.txt
sed -i 's/^/http:\/\/www./' Websites_Format_Issue.txt

#rm -rf Websites_Format_Issue.txt



#cat allpages* > forPython.html
#Remove the files generated from cURL
rm allpages*
