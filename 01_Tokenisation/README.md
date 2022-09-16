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
