from collections import Counter
import re


def count_words(sentence):
    return Counter(re.findall(r"[^\W_]+(?:'[\w]+)?", sentence.lower()))
