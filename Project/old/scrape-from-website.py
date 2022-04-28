import os
import re
import requests
from bs4 import BeautifulSoup

URL = "https://www.jetbrains.com/help/idea/"
page = "guided-tour-around-the-user-interface.html"

os.chdir("Project")

with open('idea_help.txt', 'w') as file:

    while True:
        source = requests.get(URL + page)
        soup = BeautifulSoup(source.text, "html.parser")

        article = soup.find("article")

        for tag in article.find_all(re.compile("^h[1-6]$|^p$")):
            file.write(tag.get_text() + "\n")

        if soup.find("a", {"class": "navigation-links__next"}):
            page = soup.find("a", {"class": "navigation-links__next"}).get("href")
        else:
            break
