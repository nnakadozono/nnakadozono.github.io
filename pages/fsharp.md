---
layout: page
title: F#
---
#### References
* [F# 関連のドキュメント - 概要、チュートリアル、リファレンス。 | Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/fsharp/)
* [Symbol and Operator Reference - F# | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/fsharp/language-reference/symbol-and-operator-reference/)
* [F#ドキュメント | F# documents in Japanese](https://fsdoc.jp/)

#### F# on Mac
* [Use F# on macOS | The F# Software Foundation](https://fsharp.org/use/mac/)
* [Ionide](https://ionide.io/index.html)

#### Food for Thought
* [Railway oriented programming | F# for fun and profit](https://fsharpforfunandprofit.com/posts/recipe-part2/)
* [挿入ソートと選択ソートは双対 #Haskell - Qiita](https://qiita.com/lotz/items/a69587882be6e987de4e)

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
   let myArray = [|1; 2; 3; 4; 5|]
   ```

選択肢は、特定の問題に適したデータ構造と操作に依存します。シーケンスは遅延評価とデータパイプライン処理に適しており、リストは基本的な関数型操作に適しています。一方、配列は高速なランダムアクセスが必要な場合に便利です。必要な用途に合わせて適切なコレクション型を選択することが重要です。

*Source: ChatGPT-3.5*

