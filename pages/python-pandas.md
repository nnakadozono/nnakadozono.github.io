---
layout: page
title: Python - pandas
---


#### float_format in to_csv
```python
df.to_csv("output.csv", float_format='%.2f')
```


#### 2-dimensional binning
* [python - 2-dimensional binning with Pandas - Stack Overflow](https://stackoverflow.com/questions/43422961/2-dimensional-binning-with-pandas)


#### difference (delta) from previous row
* [pandasで行・列の差分・変化率を取得するdiff, pct_change | note.nkmk.me](https://note.nkmk.me/python-pandas-diff-pct-change/)
* waypoints.reset_index().timestamp.diff().shift(-1)

#### str.contains accepts regex
* [pandas.Series.str.contains — pandas 1.5.3 documentation](https://pandas.pydata.org/docs/reference/api/pandas.Series.str.contains.html)

#### 重複: duplicated
```python
df.duplicated()
```
*Source: [pandas.DataFrame.duplicated — pandas 2.1.4 documentation](https://pandas.pydata.org/docs/reference/api/pandas.DataFrame.duplicated.html)*

