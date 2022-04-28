TODO:
- drop 5% of most and least frequent terms from the corpus
- lemmatize terms in the corpus
- synonyms?


Svetlana Toldova to Everyone (13:09)
https://ru.wikipedia.org/wiki/Okapi_BM25
Svetlana Toldova to Everyone (13:20)
https://www.english-corpora.org/coca/
Svetlana Toldova to Everyone (13:31)
https://nlp.stanford.edu/IR-book/information-retrieval-book.html
Svetlana Toldova to Everyone (13:38)
https://ru.wikipedia.org/wiki/%D0%9A%D0%BE%D1%8D%D1%84%D1%84%D0%B8%D1%86%D0%B8%D0%B5%D0%BD%D1%82_%D0%96%D0%B0%D0%BA%D0%BA%D0%B0%D1%80%D0%B0

- TFIDF vs Okapi BM25 vs Jaccard index https://en.wikipedia.org/wiki/Jaccard_index
- How to classify and clusterize questions and answers
- Filter out non-frequent words that are frequent in English (for example, if "quick" appears only 1 or 2 times in the whole corpus, it is probably a coincidence, not an indication that this word is characteristic of a document, because the word "quick" is a frequent English word, which simply happened to appear in one or two documents). For this, I need to compare infrequent words to the English frequency dictionary: https://www.english-corpora.org/coca/
- Calculate the size of the collection (how many documents are there) and the average size of documents. Depending on the proportions, I should use different metrics.
- Intro to information retrieval: https://nlp.stanford.edu/IR-book/information-retrieval-book.html

Максимально вероятная цепочка тэгов для "Мой три окна."

---

https://scikit-learn.org/stable/

LSA
PLSA https://en.wikipedia.org/wiki/Probabilistic_latent_semantic_analysis
LDA https://en.wikipedia.org/wiki/Latent_Dirichlet_allocation

classification (ML) vs topic modeling (stat)

TFIDF vs [BM25](https://ru.wikipedia.org/wiki/Okapi_BM25) vs [Jaccard index](https://en.wikipedia.org/wiki/Jaccard_index)

QA system https://lilianweng.github.io/posts/2020-10-29-odqa/

question answering text retrieval

https://towardsdatascience.com/building-an-application-of-question-answering-system-from-scratch-2dfc53f760aa

DeepPavlov http://docs.deeppavlov.ai/en/master/features/models/squad.html

---

- [NLTK](http://www.nltk.org/) (Natural Language Toolkit) is used for such tasks as tokenization, lemmatization, stemming, parsing, POS tagging, etc. This library has tools for almost all NLP tasks.
- [Spacy](https://spacy.io/) is the main competitor of the NLTK. These two libraries can be used for the same tasks.
- [Scikit-learn](http://scikit-learn.org/stable/) provides a large library for machine learning. The tools for text preprocessing are also presented here.
- [Gensim](https://radimrehurek.com/gensim/) is the package for topic and vector space modeling, document similarity.
- [Pattern](https://www.clips.uantwerpen.be/pattern) is a library for web mining. So, it supports NLP only as a side task.
- [Polyglot](https://pypi.python.org/pypi/polyglot) is the yet another python package for NLP. It is not very popular but also can be used for a wide range of the NLP tasks.

<img src="/Users/Alexey.Zhebel/IdeaProjects/CompLing/Project/python_nlp_libs.png" width="500"/>