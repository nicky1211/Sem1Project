from bs4 import BeautifulSoup
import re

url = "/home/manick/moonsoonProject16/moderndatabases-monsoon16/term-projects/WebsiteData/DataCollection/pythho.txt"
soup = BeautifulSoup(open(url).read(), "lxml")

print(soup.get_text())
#print soup.prettify()


#all_names = soup.find_all("a")
#for name in all_names:
#	print name.get("href")


#print soup.find_all("p", class_="desc-paragraph")
#print soup.find_all(string=".")
#cities = soup.find_all('div', {'class' : 'listings'})

#for city in cities:
#	print city
