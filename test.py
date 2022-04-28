import string
from nltk.corpus import stopwords
from nltk import word_tokenize

s = "Привет, как дела у тебя на работе? How are you, friend?"

# print(s.translate(str.maketrans('', '', string.punctuation)))

rusw = stopwords.words("russian")

if "гусь" in rusw:
    print("гусь есть")
else:
    print("гуся нет")

rusw.append("гусь")

if "гусь" in rusw:
    print("гусь есть")
else:
    print("гуся нет")

print(word_tokenize(s))

clean_words = [word.strip(string.punctuation) for word in word_tokenize(s)]

print(clean_words)

clean_words = [word.lower() for word in clean_words if word not in stopwords.words("russian")]

print(clean_words)