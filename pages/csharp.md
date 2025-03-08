---
layout: page
title: C#
---

### LINQPad
- [LINQPad - The .NET Programmer's Playground](https://www.linqpad.net/)

  ```csharp
  for (int i = 0; i < 5; i++) {
      Console.WriteLine(i);
  }
  ```
  
### 制御文

<table>
    <tr>
        <th>Syntax</th>
        <th>Sample</th>
        <th>Remarks</th>
    </tr>
    <!-- if -->
    <tr>
        <td> `if` </td>
        <td>
            <pre><code class="language-csharp">if (x > 0) {
    Console.WriteLine("Positive number");
} else if (x < 0) {
    Console.WriteLine("Negative number");
} else {
    Console.WriteLine("Zero");
}
</code></pre>
        </td>
        <td></td>
    </tr>
    <!-- switch -->
    <tr>
        <td><code>switch</code></td>
        <td>
            <pre><code class="language-csharp">switch (day) {
    case 1:
        Console.WriteLine("Monday");
        break;
    case 2:
        Console.WriteLine("Tuesday");
        break;
    default:
        Console.WriteLine("Other day");
        break;
}
</code></pre>
        </td>
        <td>
            Each <code>case</code> must end with a jump statement (e.g., <code>break</code>, <code>goto</code>, <code>return</code>, or <code>throw</code>). 
            There is no automatic fallthrough like in C/C++. 
            Omitting a jump statement causes a compile error.
        </td>
    </tr>
    <!-- for -->
    <tr>
        <td><code>for</code></td>
        <td>

  ```csharp
  for (int i = 0; i < 5; i++) {
      Console.WriteLine(i);
  }
  ```

        </td>
        <td>Runs a block a specified number of times.</td>
    </tr>
    <!-- while -->
    <tr>
        <td><code>while</code></td>
        <td>
            <pre><code class="language-csharp">while (x > 0) {
    x--;
    Console.WriteLine(x);
}
</code></pre>
        </td>
        <td>Executes as long as the condition is true.</td>
    </tr>
    <!-- do while -->
    <tr>
        <td><code>do while</code></td>
        <td>
            <pre><code class="language-csharp">do {
    Console.WriteLine(x);
    x--;
} while (x > 0);
</code></pre>
        </td>
        <td>Executes at least once, then checks the condition at the end.</td>
    </tr>
    <!-- foreach -->
    <tr>
        <td><code>foreach</code></td>
        <td>
            <pre><code class="language-csharp">foreach (var item in items) {
    Console.WriteLine(item);
}
</code></pre>
        </td>
        <td>Iterates through each element of a collection or array.</td>
    </tr>
    <!-- break -->
    <tr>
        <td><code>break</code></td>
        <td>
            <pre><code class="language-csharp">for (int i = 0; i < 10; i++) {
    if (i == 5) break;
}
</code></pre>
        </td>
        <td>Exits the nearest enclosing loop or switch statement.</td>
    </tr>
    <!-- continue -->
    <tr>
        <td><code>continue</code></td>
        <td>
            <pre><code class="language-csharp">for (int i = 0; i < 10; i++) {
    if (i % 2 == 0) continue;
    Console.WriteLine(i);
}
</code></pre>
        </td>
        <td>Skips the rest of the current loop iteration and continues with the next iteration.</td>
    </tr>
    <!-- return -->
    <tr>
        <td><code>return</code></td>
        <td>
            <pre><code class="language-csharp">int Add(int a, int b) {
    return a + b;
}
</code></pre>
        </td>
        <td>Exits the current method and optionally returns a value.</td>
    </tr>
</table>


### Select method
[【C#入門】LINQ の Select、Where でコレクションを操作する方法 &#124; 侍エンジニアブログ](https://www.sejuku.net/blog/47172)

- LINQ の Select メソッドとは、コレクションの要素全てを処理して別のオブジェクトに渡すときに使用します。
- LINQ とはコレクション(配列や List、Dictionary など)の要素を処理するメソッドを集めたライブラリです。
- LINQ を使うと、for 文や foreach 文を使ったループ処理を簡潔に代替することができます。

### async/await
* [async と await を使ったタスク非同期プログラミング (TAP) モデル - C# &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/csharp/asynchronous-programming/task-asynchronous-programming-model)

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


#### XML Documentation comments
[Documentation comments - document APIs using /// comments - C# &#124; Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/xmldoc/)

`///`を使うことで、ファイルで定義されている型のAPIドキュメントを生成する構造化されたコメントを含めることができます。C#コンパイラにより、コメントとAPIシグニチャを表す構造化データを含むXMLファイルが生成されます。そのXML出力を他のツールで処理して、たとえばWebページやPDFファイルの形式で、人間が判読できるドキュメントを作成できます。

```CSharp
/// <summary>
/// Enter description for method someMethod.
/// ID string generated is "M:MyNamespace.MyClass.someMethod(System.String,System.Int32@,System.Void*)".
/// </summary>
/// <param name="str">Describe parameter.</param>
/// <param name="num">Describe parameter.</param>
/// <param name="ptr">Describe parameter.</param>
/// <returns>Describe return value.</returns>
public int someMethod(string str, ref int nm, void* ptr) { return 1; }
```

#### Source generator, partial method, GeneratedRegex
* きっかけ: Formatterでregex source generationの警告がでた。
  * [SYSLIB diagnostics for regex source generation - .NET &#124; Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/fundamentals/syslib-diagnostics/syslib1040-1049)
  * 次のように直すとよいらしい。ただし、partialを使う。
  * [.NET regular expression source generators - .NET &#124; Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-source-generators?pivots=dotnet-8-0)
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
  * [partial メソッドの拡張 (C# 9.0 候補機能) &#124; ++C++; // 未確認飛行 C ブログ](https://ufcpp.net/blog/2020/6/extendingpartialmethod/)
* **GeneratedRegex**: 正規表現に相当するコードをコンパイル時に生成してくれる。
  * [GeneratedRegexで遊ぶ #C# - Qiita](https://qiita.com/kurema/items/068385ba2f8bbe3858e1)

