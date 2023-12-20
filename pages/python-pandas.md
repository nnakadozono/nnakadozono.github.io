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

#### Unpivot: melt
```python
pd.melt(df, id_vars=['A'], value_vars=['B'])
```
*Source: [pandas.melt — pandas 2.1.4 documentation](https://pandas.pydata.org/docs/reference/api/pandas.melt.html)*

#### cut: Bin values into discrete intervals
```python
pd.cut(np.array([1, 7, 5, 4, 6, 3]), 3)
```
*Source: [pandas.cut — pandas 2.1.4 documentation](https://pandas.pydata.org/docs/reference/api/pandas.cut.html)*

#### drop: Drop specified labels from rows or columns
```python
df.drop(['B', 'C'], axis=1)
```
*Source: [pandas.DataFrame.drop — pandas 2.1.4 documentation](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.drop.html)*

#### Difference between apply() and aggregate() functions
* [python - Pandas difference between apply() and aggregate() functions - Stack Overflow](https://stackoverflow.com/questions/44864655/pandas-difference-between-apply-and-aggregate-functions)


#### apply
* ある1列について、隠せるに操作をする
  ```python
  f(frame['col'])
  frame['col'].map(f)
  frame['col'].map(lambda x: f(x))
  ```
* 各行について操作をする
   ```python
   frame.apply(f, axis='columns')
   ```
* gorupbyして集約したDataFrameに対して操作をする
   ```python
   apply
   ```



## numpy, scipy
####  2-dimensional interpolation using scipy
* [scipy.interpolate.interp2dによる2次元データの補間を解説 – Helve Tech Blog](https://helve-blog.com/posts/python/scipy-interp2d/)
* [scipy.interpolate.CloughTocher2DInterpolator — SciPy v1.11.4 Manual](https://docs.scipy.org/doc/scipy/reference/generated/scipy.interpolate.CloughTocher2DInterpolator.html)
* [python - How can I perform two-dimensional interpolation using scipy? - Stack Overflow](https://stackoverflow.com/questions/37872171/how-can-i-perform-two-dimensional-interpolation-using-scipy)
* [How to Interpolate Data with Scipy | by Tirthajyoti Sarkar | Productive Data Science | Medium](https://medium.com/productive-data-science/how-to-interpolate-data-with-scipy-d314143285bc)
* [python - Problems with scipy.interpolate.interp2d - s or m too small - no more knots can be added - Stack Overflow](https://stackoverflow.com/questions/43946291/problems-with-scipy-interpolate-interp2d-s-or-m-too-small-no-more-knots-can)
* [Interpolation (scipy.interpolate) — SciPy v1.11.4 Manual](https://docs.scipy.org/doc/scipy/tutorial/interpolate.html)
* [scipy.interpolate.LinearNDInterpolator — SciPy v1.11.4 Manual](https://docs.scipy.org/doc/scipy/reference/generated/scipy.interpolate.LinearNDInterpolator.html#scipy.interpolate.LinearNDInterpolator)
* [scipy.interpolate.RegularGridInterpolator — SciPy v1.11.4 Manual](https://docs.scipy.org/doc/scipy/reference/generated/scipy.interpolate.RegularGridInterpolator.html#scipy.interpolate.RegularGridInterpolator)
* [Multivariate data interpolation on a regular grid (RegularGridInterpolator) — SciPy v1.11.4 Manual](https://docs.scipy.org/doc/scipy/tutorial/interpolate/ND_regular_grid.html)
* 

#### Most efficient way to map function over numpy array
* [python - Most efficient way to map function over numpy array - Stack Overflow](https://stackoverflow.com/questions/35215161/most-efficient-way-to-map-function-over-numpy-array)

#### Routines
* [numpy.ravel — NumPy Manual](https://numpy.org/doc/stable/reference/generated/numpy.ravel.html)

