---
layout: page
title: Python - basic
---

#### Unittest
* [unittest — Unit testing framework — Python 3.11.1 documentation](https://docs.python.org/3/library/unittest.html#command-line-interface)
* [Python unittest - assertAlmostEqual() function - GeeksforGeeks](https://www.geeksforgeeks.org/python-unittest-assertalmostequal-function/)
* [Python標準のunittestの使い方メモ - Qiita](https://qiita.com/aomidro/items/3e3449fde924893f18ca)

#### 正規表現 regex
*Reference: [Pythonの正規表現モジュールreの使い方（match, search, subなど） &#124; note.nkmk.me](https://note.nkmk.me/python-re-match-search-findall-etc/)*

* 検索
    ```python
    import re 
    m = re.search(r'regex', s)
    print(m.groups())
    print(m.group(0))
    ```
* 置換
    ```python
    import re 
    m = re.sub(r'regex', r'replace', s)
    ```

