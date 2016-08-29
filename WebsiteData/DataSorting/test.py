###############################################################
#Name : HTML Page Analyzer				      #
#Author : Manick Mehra					      #
#Purpose : To get a few details from given HTML page	      #
###############################################################


from bs4 import BeautifulSoup

#Specify the path where the file is located
page = "/home/manick/moonsoonProject16/moderndatabases-monsoon16/term-projects/TopWebsites/WebsiteData/DataCollection/IndexFiles/index.html"

#Open the file and create an object of BeautifulSoup and parse using html parser
soup = BeautifulSoup(open(page), "html.parser")

#The output of the above is not formatted as per HTML to format the HTML page we use prettify 
html = soup.prettify("utf-8")

#Write the output of the above prettify to a output file, using this file we can find the details required
with open("output.html", "wb") as file:
    file.write(html)



with open("output.html", "r") as f:
  searchlines = f.readlines()
for i, line in enumerate(searchlines):
  if "<script>" in line: 
      for l in searchlines[i:i+3]: print l,
      print

