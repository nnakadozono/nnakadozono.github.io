---
layout: page
title: JavaScript
---

Source: [改訂3版JavaScript本格入門 ～モダンスタイルによる基礎から現場での応用まで：書籍案内｜技術評論社](https://gihyo.jp/book/2023/978-4-297-13288-0)

### 基本
#### 文(Stamement)のルール
* 文の末尾をセミコロン(;)で終えるのが基本。省略しても誤りではない。
* 文の途中で空白や改行、タブを含めることもできる
* 大文字/小文字は厳密に区別される

#### コメント
* `//`

#### let, const, and var
* `let 変数名 = 初期値`
* `const 定数名 = 値`。大文字のアンダースコア形式とするのが慣例。
* var: 6.3.3

#### データ型
* 基本型(プリミティブ型)
  * 数値型(number)
  * 長整数型(bigint)
  * 文字列型(string)
    * 長い文字列は、行末に`\\`を付与することで折り返せる。
    * テンプレート文字列: `\`こんにちは、${name}さん\``。改行も折り込める。
  * 論理型(boolean)
    * true, false
    * falsyな値: 空文字列(''), ゼロ値(0, -0, 0n), null/undefined, NaN (Not a Number)
  * シンボル型(symbol)
  * 特殊型(null/undefined)
    * undefined (未定義値): ある変数の値が定義されていないことを表す値。(宣言済みだが値が与えられていない、未定義のプロパティの参照、関数で値が返されない)
    * null: 該当する値がないことを意味する値。undefinedは「定義されていない(そもそも参照することを想定していない)」。nullは「空である」という状態の明示。
* 参照型(構造型)
  * 配列(array)
    * 配列最後の要素にはカンマをつけてもつけなくても構わない。
  * オブジェクト(object)
    * 名前をキーにアクセスできる配列。ハッシュ、連想配列
    * 個々のデータはプロパティ。関数が格納されたプロパティはメソッド。
  * 関数(function)

#### リテラル
変数に格納できる値そのもの、もしくは、コードの中で値を表現する方法のこと


### 演算子(オペレーター)
* 算術演算子(代数演算子)、代入演算子、関係演算子、論理演算子(&&, ||, !)、ビット演算子、その他の演算子

#### 文(Statement)と式(Expression)
* 式とは何らかの値を返す存在。結果を変数に代入できるもの
* 式から構成され、セミころんで終わる構造のこと。変数に代入することはできない。

#### NaN (Not a Number)

#### 定数は再代入できない
定数は「値が変更できない変数」ではなく、「再代入できない変数」。参照型では、値が変更できうる。

#### ...
* ...演算子を利用することで、個々の変数に分解しきれなかった残りの要素をまとめて部分配列として切り出すことも可能
```let [x0, x1, x2, ...other] = [56, 30, 26, 82, 19, 73, 99];```
```let {title, ...rest} = {title: 'JavsScript', publisher: 'hoge', price: 2680};```

#### 厳密な等価演算子(===, !==)
型と値の厳密な一致を確認する

#### ||=演算子
valueがfalsy値である場合に、右辺の値を代入する
```value ||= '規定値';```

#### ??=演算子
||=演算子ではfalsy(ゼロ、空文字列なども。)な値を全て拾ってしまう問題がある。
```value ??= '規定値';```
??=演算子は、値がnull/undefinedの場合だけを検出する。

#### ショートカット演算(短絡演算)
論理積/論理和演算子では、「左式だけが評価されて、右式が評価されない」場合がある。このような演算のことをショートカット演算という。

#### typeof演算子
* 与えられた値のデータ型を文字列として取得できる
* 参照型に対しては、一様にobjectという値が返される。オブジェクトの種類を判別したい場合には、instanceof演算子、constructorプロパティを利用する。

#### 論理演算子を用いた論理値への変換
* !演算子を用いることで、任意の方を論理型に変換できる。
* `!!`を使えば、反転の反転になる。

### 制御構文
```javascript
if (condition) {
  ...
} else if (condition) {
  ...
} else {
  ...
}
```
* 空文: 文末のセミコロンだけを示した、中身のない文のこと。

```javascript
switch (variable) {
    case 'A':
        ...;
        break;
    case 'B':
    case 'C':
        ...;
        break;
    default :
        ...;
        break;
}
```

```javascript
while (condition) {
    ...;
}
```

```javascript
do {
    ...;
} while (condition);
```

```javascript
for (let i=5; i<10; i++) {
    console.log(i);
} 
```

```javascript
for (let key in object) {
    ;
} 
```

```javascript
for (let value of array) {
    ;
} 
```

```javascript
list.forEach(function(value, index, array) {
    ...statements...;
}, thisArg)
```
* thisArg: コールバック関数でthisが表す値



* ```break```
* ```continue```

```javascript
mylabel:
for (let key in object) {
    for (let key2 in object2) {
        if (key2 == 'value') {break mylabel;}
    }
} 
```
* 複数のループを一度に脱出する

```javascript
try {
    ...statements...;
} catch(e) {
    console.log(`${e.name}: ${e.message}`);
} finally {
    ...statements...;
}
```

```javascript
throw new Error('error message');
```

#### strictモード
```javascript
function hoge(){
    'use strict';
}
```

#### debugger命令
```javascript
debugger;
```

### 組み込みオブジェクト


