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
* Windowsインストーラー
  * .msi: アプリのパッケージファイル。Windowsインストーラー上でセットアップとして動作するファイル。
  * setup.exe: Windowsインストーラーがインストールされていない場合には、ダウンロードとインストールを行い、その他の必須コンポーネントが不足している場合にはそのダウンロードとインストールを行ってから、.msiファイルによるセットアップを開始する。






#### Source generator, partial method, GeneratedRegex
* きっかけ: Formatterでregex source generationの警告がでた。
  * [SYSLIB diagnostics for regex source generation - .NET | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/fundamentals/syslib-diagnostics/syslib1040-1049)
  * 次のように直すとよいらしい。ただし、partialを使う。
  * [.NET regular expression source generators - .NET | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-source-generators?pivots=dotnet-8-0)
	```C#
	[GeneratedRegex("abc|def", RegexOptions.IgnoreCase, "en-US")]
	private static partial Regex AbcOrDefGeneratedRegex();

	private static void EvaluateText(string text)
	{
		if (AbcOrDefGeneratedRegex().IsMatch(text))
		{
			// Take action with matching text
		}
	}
	```

* **Source generator**: ビルド時にソースコード生成してくれる仕組み
* **partialメソッドの拡張**:
  * partialクラス: classの定義を複数箇所に分けられる。自動的に生成される部分とユーザーが作成する部分を分けておく、など。
  * 既存のpartialメソッド: メソッドの宣言と定義を分けて書ける。定義を書かなくてもよい。宣言の部分を自動生成のコードに含め、定義の部分は別ファイルに手でかけば、自動生成で上書きされることがない。
  * paritialメソッドの新しい機能: 逆向きの用途で使うもの。 手書きの方が先にあって、その実装をSource Generatorに埋めてもらう。
  * [partial メソッドの拡張 (C# 9.0 候補機能) | ++C++; // 未確認飛行 C ブログ](https://ufcpp.net/blog/2020/6/extendingpartialmethod/)
* **GeneratedRegex**: 正規表現に相当するコードをコンパイル時に生成してくれる。
  * [GeneratedRegexで遊ぶ #C# - Qiita](https://qiita.com/kurema/items/068385ba2f8bbe3858e1)

