---
layout: page
title: Python - pandas
---


#### References
[Plotly Python Graphing Library](https://plotly.com/python/)


1. You jump right in to **examples** of how to make basic charts, statistical charts, scientific charts, financial charts, maps, and 3-dimensional charts.
2. If you prefer to learn about the **fundamentals** of the library first, you can read about the structure of figures, how to create and update figures, how to display figures, how to theme figures with templates, how to export figures to various formats and about Plotly Express, the high-level API for doing all of the above.
3. You can check out our exhaustive **reference** guides: the Python API reference or the Figure Reference

#### Tutorials
* [Data Visualization as The First and Last Mile of Data Science Plotly Express and Dash | SciPy 2021 - YouTube](https://www.youtube.com/watch?v=FpCgG85g2Hw)

#### Plotly Express
[Plotly express in Python](https://plotly.com/python/plotly-express/)

The plotly.express module (usually imported as px) contains functions that can create entire figures at once, and is referred to as Plotly Express or PX. Plotly Express is a built-in part of the plotly library, and is the recommended starting point for creating most common figures. Every Plotly Express function uses graph objects internally and returns a plotly.graph_objects.Figure instance. 

#### Terminology
- **trace**: グラフやチャート上に表示されるデータの系列やプロットを指します。Traceはデータの視覚化において重要な役割を果たし、グラフの構造やスタイルを指定します。Plotlyは様々な種類のトレースをサポートしており、それぞれ異なるタイプのデータを表示できます。Scatter Trace (散布図), Bar Trace (棒グラフ), Line Trace (折れ線グラフ)など。
- **facet**: グラフ内で複数の小さな部分グラフ（facet）を表示する手法を指します。これにより、異なるカテゴリや条件に基づいてデータを分割して表示することができます。facetingは、Plotly Expressの`facet_row` や `facet_col` パラメータを使用して実現されます。

#### Subplots
[Subplots in Python](https://plotly.com/python/subplots/)

```python
from plotly.subplots import make_subplots
import plotly.graph_objects as go

fig = make_subplots(rows=1, cols=2)

fig.add_trace(
    go.Scatter(x=[1, 2, 3], y=[4, 5, 6]),
    row=1, col=1
)

fig.add_trace(
    go.Scatter(x=[20, 30, 40], y=[50, 60, 70]),
    row=1, col=2
)

fig.update_layout(height=600, width=800, title_text="Side By Side Subplots")
fig.show()
```