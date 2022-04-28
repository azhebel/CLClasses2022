import os
import random
import string
import nltk
nltk.download('punkt')
nltk.download('stopwords')

import pymorphy2

from collections import defaultdict as dd
from operator import itemgetter

print(os.getcwd())

with open("new_text.txt", "r") as file:
    print("Tokenizing...")
    tokens = nltk.tokenize.word_tokenize(file.read().lower().translate(str.maketrans('', '', string.punctuation)))
    print("There are", len(tokens), "tokens in total.")
    print("First 10 tokens:", tokens[:10])

print("Counting unique tokens...")
word_count = dd(int)
stop_words = nltk.corpus.stopwords.words("english")

for word in tokens:
    if word not in stop_words:
        word_count[word] += 1

print("There are", len(word_count), "unique tokens.")

print("Sorting...")
sorted_word_count = sorted(word_count.items(), key=itemgetter(1), reverse=True)

for word, freq in sorted_word_count[:10]:
    print('\t'.join((word, str(freq))))

print("Creating a Markov dictionary...")
index = 1
markov = {}

for token in tokens[index:]:
    key = tokens[index - 1]

    if key not in markov:
        markov[key] = [token]
    else:
        markov[key].append(token)

    index += 1

word_count = int(input('How many words? '))

print("Generating sentence...")

first_word = random.choice(list(markov.keys()))
sentence = first_word.capitalize()

while len(sentence.split(' ')) < word_count:
    next_word = random.choice(markov[first_word])
    sentence += " " + next_word
    first_word = next_word

print(sentence)