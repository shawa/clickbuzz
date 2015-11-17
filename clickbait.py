#!/usr/local/bin/python3
import random
import json
import string


def rand_vals(dictionary):
    """
    dictionary:  {key : [iterable of values]}
    return : {key : <random item from iterable>}
    """
    def statistic(upper_limit):
        total = random.randint(0, upper_limit)
        n = random.randint(0, total)
        return n, total

    result = {key: random.choice(val) for key, val in dictionary.items()}

    # add some dynamic values
    result['timestamp'] = random.randint(0, 60)
    result['shortnumber'] = random.randint(0, 100)
    result['statistic'] = '{} out of {}'.format(*statistic(100))
    return result


def gen_headline(words, templates):
    """
    words: a dictionary of {word: [choices]}, where the key `word`
           appears as a parameter in the template string
    templates: a dictionary corresponding to template headlines to be populates

    return: an iterable of suitably baity headlines, as well as an iterable of
            the words used
    """
    template = random.choice(templates['headlines'])
    filler_words = rand_vals(words)
    text = template.format(**filler_words)
    if random.random() < 0.1:
        text += ' ({})'.format(random.choice(templates['warnings']))

    return string.capwords(text), filler_words


if __name__ == '__main__':
    import sys

    def main(args):
        word_file = args[1]
        templates = args[2]
        n = int(args[3])

        with open(word_file, 'r') as w, open(templates, 'r') as t:
            words = json.load(w)
            templates = json.load(t)

            for _ in range(n):
                headline, tags = gen_headline(words, templates)
                print(headline)

        return 0

    if len(sys.argv) < 4:
        progname = sys.argv[0]
        print(('{progname}. Clickbait headline generator\n'
               'usage: {progname} <filler words> <templates> <n headlines>')
              .format(progname=progname))
        sys.exit(1)

    sys.exit(main(sys.argv))
