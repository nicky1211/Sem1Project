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
sed -i 's/^ //g' List_of_Top_200_Websites.csv

#Split the List csv file into 3 files ( based on the number of digists it starts with )
sed -n 1,9p List_of_Top_200_Websites.csv > StartWith1Number.txt
sed -n 10,99p List_of_Top_200_Websites.csv > StartWith2Number.txt
sed -n 100,200p List_of_Top_200_Websites.csv > StartWith3Number.txt


#Remove the count number from the front of website names
sed -i 's/^[0-9]//g' StartWith1Number.txt
sed -i 's/^[0-9][0-9]//g' StartWith2Number.txt
sed -i 's/^[0-9][0-9][0-9]//g' StartWith3Number.txt

cat StartWith* > Website_List.txt

#Remove the Serial Number from the website name
#cat List_of_Top_200_Websites.csv | tr -d '0123456789' > Websites_Format_Issue.txt
#sed -i 's/^ //g' Websites_Format_Issue.txt
sed -i 's/^/http:\/\/www./' Website_List.txt

######### CLEAN UP ###########

#rm -rf Websites_Format_Issue.txt
rm -rf StartWith*


#cat allpages* > forPython.html
#Remove the files generated from cURL
rm allpages*
