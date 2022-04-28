import xml.etree.ElementTree as ET
from bs4 import BeautifulSoup

root = ET.parse('rnc_gostin.xml').getroot()

adverbs = []

for word in root.iter("w"):
    if "ADV" in word[0].get("gr"):
        if word.text is not None:
            adverbs.append(word.text.replace("`", ""))
        if word[0].tail is not None:
            adverbs.append(word[0].tail.replace("`", ""))

print("1. Adverbs: ", adverbs)

print("2. Text: ", repr("".join(root.itertext())))

english_word = input("3. Type English word: ")

root_trans = ET.parse('eng-rus.tei').getroot()

for entry in root_trans.iter("entry"):
    if entry.find("form").find("orth").text == english_word:
        print("Found: ", entry.find("form").find("orth").text)
        translations = []
        for sense in entry.findall("sense"):
            for cit in sense.findall("cit"):
                translations.append(cit.find("quote").text)
        print(translations)

with open("en-ru-test1.txt", "r") as file:
    current_word = ""
    body_tag = ET.Element("body")

    for line in file.readlines():
        entry = line.split("\t")

        if current_word != entry[0]:
            current_word = entry[0]
            entry_tag = ET.SubElement(body_tag, "entry")
            ET.SubElement(entry_tag, "form", lang="English").text = current_word

        ET.SubElement(entry_tag, "sense").text = entry[2]

ET.ElementTree(body_tag).write("dict.xml", encoding="utf-8", xml_declaration=True)

print("4. See 'dict.xml'")
