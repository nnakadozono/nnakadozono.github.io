---
layout: page
title: Python - basic
---

#### constrained layout
[Constrained Layout Guide — Matplotlib 3.7.1 documentation](https://matplotlib.org/stable/tutorials/intermediate/constrainedlayout_guide.html)

```python
plt.subplots(layout="constrained")

plt.rcParams['figure.constrained_layout.use'] = True
```

[Tight Layout guide — Matplotlib 3.7.1 documentation](https://matplotlib.org/stable/tutorials/intermediate/tight_layout_guide.html)
An alternative to tight_layout is constrained_layout.

#### Background color
```python
plt.figure(facecolor='white')
```


#### windrose
* [GitHub - python-windrose/windrose: A Python Matplotlib, Numpy library to manage wind data, draw windrose (also known as a polar rose plot), draw probability density function and fit Weibull distribution](https://github.com/python-windrose/windrose)
* [Welcome to windrose’s documentation! — windrose documentation](https://python-windrose.github.io/windrose/index.html)
* [Welcome to windrose’s documentation! — windrose documentation](https://windrose.readthedocs.io/en/latest/index.html)

#### stacked histogram
```python
ax.hist(x, n_bins, density=True, histtype='bar', stacked=True)
```
*source: [The histogram (hist) function with multiple data sets — Matplotlib 3.8.2 documentation](https://matplotlib.org/stable/gallery/statistics/histogram_multihist.html#sphx-glr-gallery-statistics-histogram-multihist-py)*


#### Show tick labels when sharing an axis
```python
ax.xaxis.set_tick_params(labelbottom=True)
```
*source: [python - Show tick labels when sharing an axis - Stack Overflow](https://stackoverflow.com/questions/29266966/show-tick-labels-when-sharing-an-axis)*
