# Implementation of maxmatch

```
import sys,re

# Function that runs the left-to-right longest match algorithm.
def maxmatch(sentence, dictionary):

    firstWord = '' # the first first part of the word
    remainder = '' # the remainder of the word

    # If line is empty, return nothing.
    if sentence == '':
        return list()

    # Run function on substrings of line that decrement the size of firstWord by 1 on each loop.
    for i in range(len(sentence), 1, -1):

        firstWord = sentence[0:i] # set first word to a substring from 0 to i of line
        remainder = sentence[i:] # set remainder to a substring from i to end of line of line

        # Check if firstWord is in the dictionary
        if InDictionary(firstWord, dictionary):
            return [firstWord] + maxmatch(remainder, dictionary)

    firstWord = sentence[0:1] # set firstWord to the first letter
    remainder = sentence[1:] # set lastWord to the substring from the 2nd letter onwards
    
    return [firstWord] + maxmatch(remainder, dictionary)

# Function to check if firstWord is in the dictionary list
def InDictionary(firstWord, dictionary):
    if firstWord in dictionary:
        return True
    return False

# Get line from standard input.
line = sys.stdin.readline()

# Convert file into a list
dictionary_file = open(sys.argv[1], "r")
dictionary = dictionary_file.read()
dictionary_list = dictionary.split("\n")

# Run program while line is not empty.
while line != '':

    # Print output from the maxmatch function.
    print(maxmatch(line.strip(), dictionary_list))

    # Get next line.
    line = sys.stdin.readline()

dictionary_file.close()
```

# maxmatch.py Instructions
## Requirements

    * Python 3.8.10

## Sample Execution & Output

To run this program you will need to either:

    * Pipe in a sentence as a string to be tokenized, or

    * Pipe in multiple sentences as strings separated by newlines to be tokenized

For example:

```
echo "Sentence to be tokenized." | python3 maxmatch.py dictionary-file
```

or:

```
cat file-to-be-tokenized | python3 maxmatch.py dictionary-file
```

As can be seen from the examples above, you will also need to pass in a text file containing a list of words from the target language.  The text file should be formatted such that each word is separated by a newline.  For example, your text file could look like this:

```
龍馬
龍造寺
龍海
龍名
齧っ
鼻緒
鼻
黙雷
黙秘
黙っ
```

If run correctly you should see output that could look like this:

```
['これ', 'に', '不快', '感', 'を', '示す', '住民', 'はい', 'まし', 'た', 'が', ',', '現在', ',', '表', '立っ', 'て', '反対', 'や', '抗議', 'の', '声', 'を', '挙げ', 'て', 'いる', '住民', 'はい', 'ない', 'よう', 'です', '。']
['幸福', 'の', '科学', '側', 'から', 'は', ',', '特に', 'どう', 'し', 'て', 'ほしい', 'とい', 'う', '要望', 'はい', 'ただ', 'い', 'て', 'いま', 'せ', 'ん', '。']
['星', '取り', '参加', 'は', '当然', 'と', 'さ', 'れ', ',', '不', '参加', 'は', '白', '眼', '視', 'さ', 'れる', '。']
['室長', 'の', '対応', 'に', 'は', '終始', '誠実', 'さ', 'が', '感じ', 'られ', 'た', '。']
['多く', 'の', '女性', 'が', '生', '理', 'の', 'こと', 'で', '悩ん', 'で', 'いま', 'す', '。']
['先生', 'の', '理想', 'は', '限り', 'なく', '高い', '。']
['それ', 'は', '兎', 'も', '角', ',', '私', 'も', '明日', 'の', '社', '説', 'を', '楽しみ', 'に', 'し', 'て', 'おり', 'ます', '。']
['そう', 'だっ', 'たら', 'いい', 'なあ', 'と', 'は', '思い', 'ます', 'が', ',', '日本', '学術', '会議', 'の', '会長', '談', '話', 'に', 'つい', 'て', '“', '当会', 'で', 'は', ',', '標記', 'の', '件', 'に', 'つい', 'て', ',', '以下', 'の', 'よう', 'に', '考え', 'ます', '。', '”']
['教団', 'に', 'とっ', 'て', 'は', '存続', 'が', '厳しく', 'なる', 'と', '思う', '。']
['しかし', '強制', 'し', 'て', 'い', 'なく', 'て', 'も', '問題', 'です']
```

# Description of Performance

The maxmatch.py program correctly tokenizes many sentences, but it does not correctly tokenize everything.  By calculating the word error rate for each sentence and averaging the values the maxmatch.py tokenizer gets a WER percentage of 18.68% (where 0% means there is no word error).  Some of the words it does not correctly tokenize includes words that can be combined to create a longer word and words that are not in the dictionary file; for example:
```
REF: ['これ', 'に', '不快', '感', 'を', '示す', '住民', 'は', 'い',  'まし', 'た', 'が', ',', '現在', ',', '表立っ',       'て', '反対', 'や', '抗議', 'の', '声', 'を', '挙げ', 'て', 'いる', '住民', 'は', 'い',  'ない', 'よう', 'です', '。'] 
HYP: ['これ', 'に', '不快', '感', 'を', '示す', '住民',      'はい', 'まし', 'た', 'が', ',', '現在', ',', '表',   '立っ', 'て', '反対', 'や', '抗議', 'の', '声', 'を', '挙げ', 'て', 'いる', '住民',      'はい', 'ない', 'よう', 'です', '。'] 
EVA:                                         D    S                                     S      I                                                                 D    S                            
WER: 18.18%
```
where the words 'は' and 'い' are combined into 'はい' and '表立っ' is separated into '表' & '立っ'.  The reason 'は' and 'い' are combined into 'はい' is because maxmatch.py chooses the longest word that could exist as the word to separate out.  As for '表立っ', it is separated into '表' & '立っ' because the word '表立っ' does not exist in the dictionary-file, but the words '表' & '立っ' do exist in the dictionary-file.  There are also cases where words are split up because they are not in the dictionary-file, but by breaking them up they combine with parts of words next to them; for example:

```
REF: ['幸福', 'の', '科学', '側', 'から', 'は', ',', '特に', 'どう', 'し', 'て', 'ほしい', 'と',  'いう', '要望', 'は',  'いただい',      'て', 'い',  'ませ', 'ん', '。'] 
HYP: ['幸福', 'の', '科学', '側', 'から', 'は', ',', '特に', 'どう', 'し', 'て', 'ほしい', 'とい', 'う',  '要望', 'はい', 'ただ',   'い', 'て', 'いま', 'せ',  'ん', '。'] 
EVA:                                                                     S     S           S     S       I         S     S               
WER: 31.82%
```
where the word 'いただい' is not in the dictionary file so it is broken up into 'はい', 'ただ', and 'い', taking the previous word and combining it with the following symbol to create a longer word.
