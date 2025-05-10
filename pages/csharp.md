---
layout: page
title: C#
---
* TOC
{:toc}

## List\<T\>

可変長のリスト構造。インデックスアクセスが可能で、要素の追加・削除が容易。(配列(Array)`T[]`は固定サイズで変更不可。)

### Listの初期化

```csharp
List<int> list = new List<int>();

var list = new List<int>();

List<int> list = new List<int>(100);

List<int> list = new List<int> { 1, 2, 3, 4, 5 };

List<int> anotherList = new List<int>(list);

int[] array = { 10, 20, 30 };
List<int> listFromArray = new List<int>(array);
```

### Listのメソッドとプロパティ

| Method / Property          | Description                                                | Example                                  |
|----------------------------|------------------------------------------------------------|------------------------------------------|
| `Add(item)`                | リスト末尾に要素を追加                                     | `list.Add(10);`                           |
| `AddRange(items)`          | 他のコレクションの要素をまとめて追加                        | `list.AddRange(new int[] { 20, 30 });`    |
| `Insert(index, item)`      | 指定インデックスに要素を挿入                               | `list.Insert(0, 5); // 先頭に挿入`       |
| `Remove(item)`             | 指定要素を削除（見つからなければ何もしない）                | `list.Remove(10);`                        |
| `RemoveAt(index)`          | 指定インデックスの要素を削除                               | `list.RemoveAt(0);`                       |
| `RemoveAll(predicate)`     | 条件に一致するすべての要素を削除                           | `list.RemoveAll(x => x < 10);`            |
| `Contains(item)`           | 指定要素が含まれているか判定                               | `bool hasValue = list.Contains(20);`      |
| `IndexOf(item)`            | 指定要素の最初のインデックスを取得（見つからなければ -1）  | `int idx = list.IndexOf(20);`             |
| `LastIndexOf(item)`        | 指定要素の最後のインデックスを取得（見つからなければ -1）  | `int lastIdx = list.LastIndexOf(20);`     |
| `Find(predicate)`          | 条件に一致する最初の要素を返す                             | `int found = list.Find(x => x > 10);`     |
| `FindAll(predicate)`       | 条件に一致するすべての要素を含む新しいリストを返す。条件に一致する要素がない場合、空のリスト (Count == 0) を返す (`null` ではない)         | `var evens = list.FindAll(x => x % 2 == 0);` |
| `FindIndex(predicate)`     | 条件に一致する最初の要素のインデックスを返す（-1 ならなし）| `int index = list.FindIndex(x => x == 20);`|
| `Sort()`                   | 要素を昇順にソート                                         | `list.Sort();`                            |
| `Sort(comparison)`         | カスタムの比較方法でソート                                 | `list.Sort((a, b) => b.CompareTo(a));`    |
| `BinarySearch(item)`       | ソートされたリスト内でバイナリ検索（見つからなければ -1）  | `int pos = list.BinarySearch(20);`        |
| `Reverse()`                | 要素を逆順に並び替え                                       | `list.Reverse();`                         |
| `Clear()`                  | すべての要素を削除                                         | `list.Clear();`                           |
| `ForEach(action)`          | 各要素に対して指定のアクションを実行                       | `list.ForEach(x => Console.WriteLine(x));`|
| `ConvertAll(converter)`    | すべての要素を変換し新しいリストを返す                     | `var strList = list.ConvertAll(x => x.ToString());` |
| `ToArray()`                | リストを配列に変換                                         | `int[] array = list.ToArray();`           |
| `CopyTo(array, index)`     | リストの要素を別の配列にコピー                             | `list.CopyTo(array, 0);`                  |
| `Count` (Property)         | 要素数を取得                                               | `int count = list.Count;`                 |
| `Capacity` (Property)      | 内部バッファーのサイズを取得または設定                     | `list.Capacity = 100;`                    |
| `TrimExcess()`             | メモリの無駄を減らすために容量を要素数に合わせて調整       | `list.TrimExcess();`                      |
| `GetRange(index, count)`   | 指定範囲の要素を含む新しいリストを返す。コピーが行われるため、元のリストが変更されても新しいリストには影響しない。                     | `var sublist = list.GetRange(1, 3);`      |


## LINQのメソッド構文
LINQ (Language Integrated Query)は、SQL文の構文をC#言語に取り込んだもの。データベース、コレクションコレクション (`T[]`, `List<T>`, `Dictionary<TKey, TValue>`)、XMLドキュメントなどの操作を統一した構文で扱うことができる。クエリ式とメソッド構文がある。処理が必要な時にだけクエリが実行される、遅延実行。

### 投影 (Projection)

| メソッド            | 説明                                           | 例                                      |
|---------------------|----------------------------------------------|----------------------------------------|
| `Select`           | 各要素を変換                                  | `list.Select(x => x * 2)`               |
| `SelectMany`       | ネストされたコレクションをフラット化            | `list.SelectMany(x => x.Children)`      |

### 要素取得 (Element Operators)

| メソッド            | 説明                                           | 例                                      |
|---------------------|----------------------------------------------|----------------------------------------|
| `First`            | 最初の要素を取得（該当なしなら例外）            | `list.First()`                          |
| `FirstOrDefault`   | 最初の要素を取得（該当なしなら default）        | `list.FirstOrDefault()`                 |
| `Last`             | 最後の要素を取得（該当なしなら例外）            | `list.Last()`                           |
| `LastOrDefault`    | 最後の要素を取得（該当なしなら default）        | `list.LastOrDefault()`                  |
| `ElementAt`        | 指定インデックスの要素を取得                    | `list.ElementAt(2)`                     |
| `ElementAtOrDefault` | 指定インデックスの要素（範囲外なら default） | `list.ElementAtOrDefault(10)`           |
| `Single`           | 1つの要素を取得（複数なら例外）                | `list.Single(x => x.Id == 1)`           |
| `SingleOrDefault`  | 1つの要素を取得（該当なしなら default）        | `list.SingleOrDefault(x => x.Id == 1)`  |
| `DefaultIfEmpty`   | 空の場合に default 値を追加                     | `list.DefaultIfEmpty()`                 |

### フィルタリング (Filtering)

| メソッド            | 説明                                           | 例                                      |
|---------------------|----------------------------------------------|----------------------------------------|
| `Where`            | 条件に合う要素を抽出                          | `list.Where(x => x > 10)`               |
| `OfType<T>`        | 指定した型にキャスト可能な要素を取得           | `objects.OfType<int>()`                 |
| `Distinct`         | 重複を削除                                     | `list.Distinct()`                       |
| `Take`             | 先頭から指定数だけ取得                         | `list.Take(3)`                          |
| `TakeWhile`        | 条件を満たす間だけ取得                         | `list.TakeWhile(x => x < 50)`           |
| `Skip`             | 先頭から指定数をスキップ                       | `list.Skip(2)`                          |
| `SkipWhile`        | 条件を満たす間スキップ                         | `list.SkipWhile(x => x < 50)`           |
| `Append`           | コレクションの末尾に要素を追加                 | `list.Append(99)`                       |
| `Prepend`          | コレクションの先頭に要素を追加                 | `list.Prepend(0)`                       |
| `ExceptBy`         | 特定のキーに基づいて片方にしかない要素を取得   | `list1.ExceptBy(list2, x => x.Key)`     |


### 並べ替え (Ordering)

| メソッド            | 説明                                           | 例                                      |
|---------------------|----------------------------------------------|----------------------------------------|
| `OrderBy`          | 昇順にソート                                   | `list.OrderBy(x => x.Age)`              |
| `OrderByDescending`| 降順にソート                                   | `list.OrderByDescending(x => x.Age)`    |
| `ThenBy`           | 二次ソート（昇順）                             | `list.OrderBy(x => x.Age).ThenBy(x => x.Name)` |
| `ThenByDescending` | 二次ソート（降順）                             | `list.OrderBy(x => x.Age).ThenByDescending(x => x.Name)` |
| `Reverse`          | コレクションの要素を逆順にする                 | `list.Reverse()`                        |
| `Shuffle` (拡張メソッド) | 要素をランダムに並び替える               | `list.OrderBy(x => Guid.NewGuid())`     |


### グループ化 (Grouping)

| メソッド            | 説明                                           | 例                                      |
|---------------------|----------------------------------------------|----------------------------------------|
| `GroupBy`          | キーごとに要素をグループ化                     | `list.GroupBy(x => x.Category)`         |
| `ToLookup`         | 読み取り専用のグループ化 (辞書型の出力)        | `list.ToLookup(x => x.Category)`        |


### 集計 (Aggregation)

| メソッド            | 説明                                           | 例                                      |
|---------------------|----------------------------------------------|----------------------------------------|
| `Count`            | 要素数を取得                                   | `list.Count()`                          |
| `Sum`              | 合計を計算                                     | `list.Sum(x => x.Price)`                |
| `Average`          | 平均を計算                                     | `list.Average(x => x.Age)`              |
| `Min`              | 最小値を取得                                   | `list.Min()`                            |
| `Max`              | 最大値を取得                                   | `list.Max()`                            |
| `Aggregate`        | 累積計算を実行                                 | `list.Aggregate((a, b) => a + b)`       |


### 判定 (Quantifiers)

| メソッド            | 説明                                           | 例                                      |
|---------------------|----------------------------------------------|----------------------------------------|
| `Any`              | 1つでも条件を満たす要素があるか判定            | `list.Any(x => x > 10)`                 |
| `All`              | すべての要素が条件を満たすか判定               | `list.All(x => x > 0)`                  |
| `Contains`         | 特定の要素が含まれているか判定                 | `list.Contains(5)`                      |
| `SequenceEqual`    | 2つのシーケンスが等しいか判定                  | `list1.SequenceEqual(list2)`            |


### 変換 (Conversion)

| メソッド            | 説明                                           | 例                                      |
|---------------------|----------------------------------------------|----------------------------------------|
| `ToList`           | List<T> に変換                                | `list.ToList()`                         |
| `ToArray`          | 配列 T[] に変換                                | `list.ToArray()`                        |
| `ToDictionary`     | Dictionary<TKey, TValue> に変換                | `list.ToDictionary(x => x.Id)`          |
| `Cast<T>`          | 型をキャスト                                   | `objects.Cast<int>()`                   |
| `OfType<T>`        | 指定型のみを抽出                               | `list.OfType<string>()`                 |


### 連結・結合 (Joining & Concatenation)

| メソッド            | 説明                                           | 例                                      |
|---------------------|----------------------------------------------|----------------------------------------|
| `Concat`           | 2つのシーケンスを結合                          | `list1.Concat(list2)`                   |
| `Union`            | 2つのシーケンスを結合（重複なし）               | `list1.Union(list2)`                    |
| `Intersect`        | 共通の要素のみ取得                              | `list1.Intersect(list2)`                |
| `Except`           | 片方にしかない要素を取得                        | `list1.Except(list2)`                   |
| `Join`             | 内部結合（INNER JOIN 相当）                     | `list1.Join(list2, x => x.Id, y => y.Id, (x, y) => new { x, y })` |
| `GroupJoin`        | グループ化して結合                              | `list1.GroupJoin(list2, x => x.Id, y => y.Id, (x, ys) => new { x, ys })` |



## 制御文
<table>
    <tr>
        <th>Syntax</th>
        <th>Sample</th>
        <th>Remarks</th>
    </tr>
    <!-- if -->
    <tr>
        <td><code>if</code></td>
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
            各<code>case</code>の末尾には<code>break</code>、<code>goto</code>、<code>return</code>、<code>throw</code>などのジャンプステートメントが必要。
            C/C++のような自動フォールスルーはない。
            ジャンプステートメントを省略するとコンパイルエラーになる。
        </td>
    </tr>
    <!-- for -->
    <tr>
        <td><code>for</code></td>
        <td>
            <pre><code class="language-csharp">for (int i = 0; i < 5; i++) {
    Console.WriteLine(i);
}
</code></pre>
        </td>
        <td></td>
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
        <td></td>
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
        <td></td>
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
        <td></td>
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
        <td></td>
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
        <td></td>
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
        <td></td>
    </tr>
</table>


## async/await
* [async と await を使ったタスク非同期プログラミング (TAP) モデル - C# &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/csharp/asynchronous-programming/task-asynchronous-programming-model)

## チーム開発の教科書
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


### XML Documentation comments
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

### Source generator, partial method, GeneratedRegex
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

## Tools
- [LINQPad - The .NET Programmer's Playground](https://www.linqpad.net/)



