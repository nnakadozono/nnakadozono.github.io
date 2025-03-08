---
layout: page
title: F#
---
#### References
* [F# 関連のドキュメント - 概要、チュートリアル、リファレンス。 &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/fsharp/)
* [Symbol and Operator Reference - F# &#124; Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/fsharp/language-reference/symbol-and-operator-reference/)
* [F#ドキュメント &#124; F# documents in Japanese](https://fsdoc.jp/)
* [F#リファレンス](https://midoliy.com/content/fsharp/index.html)
* [F# Programming お気楽 F# プログラミング超入門](http://www.nct9.ne.jp/m_hiroi/csharp/fsharp.html)


#### F# on Mac
* [Use F# on macOS &#124; The F# Software Foundation](https://fsharp.org/use/mac/)
* [Ionide](https://ionide.io/index.html)

#### Food for Thought
* [Railway oriented programming &#124; F# for fun and profit](https://fsharpforfunandprofit.com/posts/recipe-part2/)
* [挿入ソートと選択ソートは双対 #Haskell - Qiita](https://qiita.com/lotz/items/a69587882be6e987de4e)


####
基底クラス、インターフェイス、および同様のメソッドから、XML コメントを継承する。
* [Visual Studio 2019 v16.4以降でC#を使う場合にはinheritdocを使った方がいいという話 #C# - Qiita](https://qiita.com/tat_tt/items/095db2ff7f754a01ecb6)
* [クラスとそのメンバー用として推奨される XML ドキュメント タグ - C# &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/csharp/language-reference/xmldoc/recommended-tags#inheritdoc)


#### Option.map
`map f inp` は次と同じ。
```fsharp
match inp with 
| None -> None 
| Some x -> Some (f x)
```

[Option (FSharp.Core) &#124; FSharp.Core](https://fsharp.github.io/fsharp-core-docs/reference/fsharp-core-optionmodule.html#bind)

```fsharp
 None |> Option.map (fun x -> x * 2) // evaluates to None
 Some 42 |> Option.map (fun x -> x * 2) // evaluates to Some 84
```


#### Option.bind
`bind f inp` は次と同じ。ここで `f` はOption型を返す関数。
```fsharp
match inp with 
| None -> None 
| Some x -> f x
```

[Option (FSharp.Core) &#124; FSharp.Core](https://fsharp.github.io/fsharp-core-docs/reference/fsharp-core-optionmodule.html#bind)

```fsharp
let tryParse (input: string) =
   match System.Int32.TryParse input with
   | true, v -> Some v
   | false, _ -> None
None |> Option.bind tryParse // evaluates to None
Some "42" |> Option.bind tryParse // evaluates to Some 42
Some "Forty-two" |> Option.bind tryParse // evaluates to None
```

#### Option.toNullable
Convert the option to a Nullable value.

[Option (FSharp.Core) &#124; FSharp.Core](https://fsharp.github.io/fsharp-core-docs/reference/fsharp-core-optionmodule.html#toNullable)

```fsharp
(None: int option) |> Option.toNullable // evaluates to new System.Nullable<int>()
Some 42 |> Option.toNullable // evaluates to new System.Nullable(42)
```

#### Option.toObj
Convert an option to a potentially null value.

[Option (FSharp.Core) &#124; FSharp.Core](https://fsharp.github.io/fsharp-core-docs/reference/fsharp-core-optionmodule.html#toObj)

```fsharp
(None: string option) |> Option.toObj // evaluates to null
Some "not a null string" |> Option.toObj // evaluates to "not a null string"
```

#### Option型の比較
F#の `option` 型は、 `None` と `Some` の間で比較を行うとき、次の順序関係をもつ。
- `None` は、常に `Some` より小さいとみなされる。
- `Some` の場合は、その中の値同士で比較が行われる。

  ```fsharp
  > let x: int option = Some 1;;
  > let y: int option = Some 2;;
  
  > x > y;;
  val it: bool = false
  
  > x < y;;
  val it: bool = true
  ```

  ```fsharp
  > let z: int option = None;;
  
  > x < z;;
  val it: bool = false
  
  > x > z;;
  val it: bool = true
  ```
  
  ```fsharp
  > let t: int option = None;;
  
  > z > t;;
  val it: bool = false
  
  > z < t;;
  val it: bool = false
  
  > z = t;;
  val it: bool = true
  ```

#### F# on Mac (2024)
* [Use F# on macOS &#124; The F# Software Foundation](https://fsharp.org/use/mac/)
* [Get Started with F# in Visual Studio Code - .NET &#124; Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/fsharp/get-started/get-started-vscode)
* VS Codeでやる場合、
  1. .NET Core SDKをインストール (.NET 6だと、VS CodeでF#を動かせない!)
  1. VS CodeにIonideの機能拡張を入れる
  1. ```dotnet new console -lang "F#" -o FirstIonideProject```
  1. MyFirstScript.fsxに何か書く
  1. 選択して、Alt+Enter (FSI: Send selection)するとTerminalが立ち上がってFSIが走る

#### Fnatomas
* [Fantomas](https://fsprojects.github.io/fantomas/)
F# source code formatter


#### Seq, List, Array

F#での`Seq`、`List`、`Array`は、異なるコレクション型であり、それぞれ異なる用途に適しています。以下にそれぞれのコレクション型について説明します。

1. `Seq`（シーケンス）:
   - `Seq`は遅延評価（または遅延実行）のコレクション型です。つまり、要素は必要に応じて遅延評価され、メモリ効率が高く、無限のシーケンスを表現できます。
   - データの順次処理に適しており、LINQクエリ式と組み合わせて使用することが一般的です。
   - `Seq`はイミュータブル（変更不可）であり、要素の追加や削除はサポートしていません。操作は新しい`Seq`を生成します。

   ```fsharp
   let seq = Seq.init 10 (fun i -> i * 2) // 0, 2, 4, 6, 8, 10, 12, 14, 16, 18
   ```

2. `List`（リスト）:
   - `List`はイミュータブル（変更不可）なリストコレクションです。要素の追加や削除はサポートされず、新しいリストを生成して変更を反映します。
   - リスト内の要素へのランダムアクセスが遅いことがありますが、要素の追加や削除はリストの先頭に対して高速です。
   - F#のリストは再帰的なデータ構造であり、基本的な関数型操作に適しています。

   ```fsharp
   let myList = [1; 2; 3; 4; 5]
   ```

3. `Array`（配列）:
   - `Array`は可変サイズでない、イミュータブルな配列です(本当か?????)。要素へのランダムアクセスが高速で、一度作成された後に要素を変更することはできません。
   - 配列は基本的にメモリ内に連続した要素を格納するため、インデックスベースのアクセスが高速です。しかし、サイズを変更できないため、大規模な要素の挿入や削除は非効率的です。
   - 配列は要素の操作や高性能のアルゴリズムに適しています。

   ```fsharp
   let myArray = [|1; 2; 3; 4; 5&#124;]
   ```

選択肢は、特定の問題に適したデータ構造と操作に依存します。シーケンスは遅延評価とデータパイプライン処理に適しており、リストは基本的な関数型操作に適しています。一方、配列は高速なランダムアクセスが必要な場合に便利です。必要な用途に合わせて適切なコレクション型を選択することが重要です。

*Source: ChatGPT-3.5*

