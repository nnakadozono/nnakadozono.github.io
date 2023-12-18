---
layout: page
title: C#
---

### LINQPad
- [LINQPad - The .NET Programmer's Playground](https://www.linqpad.net/)

### Select method
[【C#入門】LINQ の Select、Where でコレクションを操作する方法 | 侍エンジニアブログ](https://www.sejuku.net/blog/47172)

- LINQ の Select メソッドとは、コレクションの要素全てを処理して別のオブジェクトに渡すときに使用します。
- LINQ とはコレクション(配列や List、Dictionary など)の要素を処理するメソッドを集めたライブラリです。
- LINQ を使うと、for 文や foreach 文を使ったループ処理を簡潔に代替することができます。

### async/await
* [async と await を使ったタスク非同期プログラミング (TAP) モデル - C# | Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/csharp/asynchronous-programming/task-asynchronous-programming-model)

### チーム開発の教科書
* 静的コード分析
* オブジェクト思考の設計には**UMLクラス図**が必須
* MVVM
  * M: Model - DBやクラウドサービスから入手したデータを入れる「箱」
  * V: View - 画面に表示して、人がデータの内容を確認できるようにするための「見せ方」
  * VM: View Model - 画面に表示するためのデータを入れるもう一つの「箱」。モデルからデータを複製して、画面ごとの表示用モデルとする。
  * メリット: (Modelを直接Viewに表示することと比較して、) データの変更に強い構造であるため保守性が高い。テストがしやすいため品質を高く保てる。ViewModelでワンクッション置ける。値の変更検知と更新が手軽。

* ASP.NET MVC: 「設定より規約」。一定の命名規則で作成されたファイルや宣言されたクラスによって、ControllerとViewが自動的に連携して動作する。
* LINQを使う理由: チェーン(IEnumerable<T>に対して実行され、IEnumerable<T>を返す)とショートサーキット(条件の評価が連続して行われるときに最初の評価が義であれば後の評価は実行されずに処理が短縮されて終わること。)
* LINQを使う際のポイント
  * 遅延評価。whereやselectではデータベースにアクセスせず、即時評価のToListやFirstOrDefaultが実行されて初めて処理される。実行される瞬間に1つのクエリに変換される。
  * LINQ to SQLから、LINQ to Objectsに入れ替わるタイミング。SQLとC#で異なる。混在させない。
* Lambda式: ?.Where(p => p.Prive>1000)。小さな範囲である限定的な目的のために繰り返し同じ処理を実行したい場合に使う。publicメソッドを作成してしまうと、他から使われる可能性があるため、きちんと設計やテストをしなくてはならなくなる。


#### MSDN (Microsoft Developer Network) -> Microsoft Docs (2020-) -> Microsoft Learn (2022-)
**[Microsoft Developer Network - Wikipedia](https://en.wikipedia.org/wiki/Microsoft_Developer_Network)**

Microsoft Developer Network (MSDN) was the division of Microsoft responsible for managing the firm's relationship with developers and testers, such as hardware developers interested in the operating system (OS), and software developers developing on the various OS platforms or using the API or scripting languages of Microsoft's applications. The relationship management was situated in assorted media: web sites, newsletters, developer conferences, trade media, blogs and DVD distribution.

Starting in January 2020, the website was fully integrated with Microsoft Docs (itself integrated into Microsoft Learn in 2022).

MSDN's primary web presence at msdn.microsoft.com was a collection of sites for the developer community that provided information, documentation, and discussion that was authored both by Microsoft and by the community at large.


