import urllib2

wiki = "http://www.alexa.com/topsites/countries/IN"

page = urllib2.urlopen(wiki)

from bs4 import BeautifulSoup

soup = BeautifulSoup(page)

print soup.a
