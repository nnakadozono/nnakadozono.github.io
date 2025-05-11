---
layout: post
title:  "async/await"
date:   2024-05-11 12:00:00 +0900
categories: blog
---

## 非同期プログラミング
非同期処理(<=>同期処理)では、時間のかかる処理(HTTP request, I/O, database等)がある場合に、その処理の終了を待つことなく別の処理を行うことが可能。(TODO: 並列と並行。スレッド。)

* `async`(修飾子): 非同期処理であることを明示する。
* `await`(演算子): 指定した非同期処理が終わるまで待機する。処理が終わるまで次に進まない。処理が終わるまでの間は他の処理に制御を戻す。

awaitを使う関数はasyncにする必要がある。awaitがなくてもasyncをつけるのはOK。

## 非同期プログラミングの基本 (Python)

*Reference: [コルーチンと Task — Python 3.13.3 ドキュメント](https://docs.python.org/ja/3.13/library/asyncio-task.html#coroutines)*
* コルーチン(`async def`)とはサブルーチンのより一般的な形式(<=> サブルーチン)。中断や再開ができる。
* 単に`main()`を呼び出しただけでは実行されない。`asyncio.run()`もしくは`await`が必要。

### awaitが直列

1秒間待機した後に"hello"と出力し、更に2秒間待機してから"world"と出力。`await`は**その処理が終わるまで次に進まない**という意味。

```python
import asyncio
import time

async def say_after(delay, what):
    await asyncio.sleep(delay)
    print(what)

async def main():
    print(f"started at {time.strftime('%X')}")

    await say_after(1, 'hello')
    await say_after(2, 'world')

    print(f"finished at {time.strftime('%X')}")

asyncio.run(main())
```

```
started at 17:13:52
hello
world
finished at 17:13:55
```

この例ではawaitを直列に呼び出しているため、非同期の恩恵はほとんどない。`say_after(1, 'hello')`の中で`await asyncio.sleep(1)`をすると、Pythonは「この関数は今やることがない（1秒寝るだけ）ので、他のイベントループ上の処理に進んでいいよ」となるが。このコードでは他にやる処理は存在していないので、実際には他の処理はなく、イベントループは「1秒待ったらsay_afterを再開する」という予約をして、その時間をただ消費する。非同期を使っていても、すべてawaitで直列につないでいるとほとんど意味がない。

### Taskで並行処理

Taskを用いることで、ふたつの`say_after`コルーチンを並行して走らせる。create_task()をした時点で非同期処理は開始される(書き方や言語によって違うので注意)。「実行は今すぐ始めたいが、結果は後で使いたい」という状況に向いている。結果が必要になった時点で`await task`すれば、その時までに処理が完了していれば即座に返り、まだ終わっていなければ終わるまで待つ、という動きになる。

```python
async def main():
    task1 = asyncio.create_task(say_after(1, 'hello'))
    task2 = asyncio.create_task(say_after(2, 'world'))

    print(f"started at {time.strftime('%X')}")

    # Wait until both tasks are completed (should take
    # around 2 seconds.)
    await task1
    await task2

    print(f"finished at {time.strftime('%X')}")
```

予想される出力が前回よりも1秒早い。

```
started at 17:14:32
hello
world
finished at 17:14:34
```

非同期関数の返り値が重要な場面では、どのタスクを並行に走らせてよいか?、どの時点で結果が必要になるか?、といったことを慎重に設計しないと、思わぬ順序バグやパフォーマンスの低下につながる。

### async with

`TaskGroup`を使った方法。

```python
async def main():
    async with asyncio.TaskGroup() as tg:
        task1 = tg.create_task(
            say_after(1, 'hello'))

        task2 = tg.create_task(
            say_after(2, 'world'))

        print(f"started at {time.strftime('%X')}")

    # The await is implicit when the context manager exits.

    print(f"finished at {time.strftime('%X')}")
```

この記法だと、並行に処理されるtaskが明確になったり、結果が利用可能なタイミングが明確になる(と思われる)。


## 言語間の比較

<table>
  <tr>
    <th>項目</th>
    <th>Python</th>
    <th>C#</th>
    <th>F# <code>task {}</code></th>
    <th>F# <code>async {}</code></th>
  </tr>

  <tr>
    <td><code>async</code></td>
    <td><code>async def func():</code></td>
    <td><code>async Task Func()</code></td>
    <td><code>task { ... }</code></td>
    <td><code>async { ... }</code></td>
  </tr>

  <tr>
    <td><code>await</code></td>
    <td><code>result = await func()</code></td>
    <td><code>var result = await Func();</code></td>
    <td><code>let! result = func()</code> または <code>do! func()</code></td>
    <td><code>let! result = func()</code> または <code>do! func()</code></td>
  </tr>

  <tr>
    <td>Task</td>
    <td><code>task = asyncio.create_task(func())</code><br>hot (すぐに実行開始)</td>
    <td><code>var t = Func();</code><br>hot（呼び出し時に実行開始）</td>
    <td><code>let task1 = func()</code>（タスク返す関数）<br>hot（作成時に即実行）</td>
    <td><code>let task1 = func()</code>（非同期ワークフロー）<br>cold（明示的に起動するまで実行されない）</td>
  </tr>

  <tr>
    <td>非同期処理の実行</td>
    <td><code>asyncio.run(main())</code></td>
    <td><code>await MainAsync()</code> または <code>MainAsync().GetAwaiter().GetResult()</code></td>
    <td><code>task { ... } |> Task.start</code> または <code>Async.StartAsTask</code></td>
    <td><code>Async.RunSynchronously</code> または <code>Async.Start</code></td>
  </tr>

  <tr>
    <td>例1（逐次処理）</td>
    <td>
<pre><code class="language-python">import asyncio

async def say_after(delay, what):
    await asyncio.sleep(delay)
    return what

async def main():
    result1 = await say_after(1, "hello")
    result2 = await say_after(2, "world")
    print(result1 + " " + result2)

asyncio.run(main())</code></pre>
    </td>
    <td>
<pre><code class="language-csharp">using System;
using System.Threading.Tasks;

async Task&lt;string&gt; SayAfter(int delay, string what)
{
    await Task.Delay(delay * 1000);
    return what;
}

async Task MainAsync()
{
    var result1 = await SayAfter(1, "hello");
    var result2 = await SayAfter(2, "world");
    Console.WriteLine(result1 + " " + result2);
}

await MainAsync();</code></pre>
    </td>
    <td>
<pre><code class="language-fsharp">open System.Threading.Tasks

let sayAfter delay what = task {
    do! Task.Delay(delay * 1000)
    return what
}

let main = task {
    let! result1 = sayAfter 1 "hello"
    let! result2 = sayAfter 2 "world"
    printfn "%s %s" result1 result2
}

main.Wait()</code></pre>
    </td>
    <td>
<pre><code class="language-fsharp">let sayAfter delay what = async {
    do! Async.Sleep(delay * 1000)
    return what
}

let main = async {
    let! result1 = sayAfter 1 "hello"
    let! result2 = sayAfter 2 "world"
    printfn "%s %s" result1 result2
}

Async.RunSynchronously main</code></pre>
    </td>
  </tr>

  <tr>
    <td>例2（並行処理）</td>
    <td>
<pre><code class="language-python">async def main():
    task1 = asyncio.create_task(say_after(1, "hello"))
    task2 = asyncio.create_task(say_after(2, "world"))
    result1 = await task1
    result2 = await task2
    print(result1 + " " + result2)

asyncio.run(main())</code></pre>
    </td>
    <td>
<pre><code class="language-csharp">async Task MainAsync()
{
    var task1 = SayAfter(1, "hello");
    var task2 = SayAfter(2, "world");
    var results = await Task.WhenAll(task1, task2);
    Console.WriteLine(results[0] + " " + results[1]);
}

await MainAsync();</code></pre>
    </td>
    <td>
<pre><code class="language-fsharp">let main = task {
    let t1 = sayAfter 1 "hello"
    let t2 = sayAfter 2 "world"
    let! results = Task.WhenAll(t1, t2)
    printfn "%s %s" results[0] results[1]
}

main.Wait()</code></pre>
    </td>
    <td>
<pre><code class="language-fsharp">let main = async {
    let t1 = sayAfter 1 "hello"
    let t2 = sayAfter 2 "world"
    let! results = [t1; t2] |> Async.Parallel
    printfn "%s %s" results[0] results[1]
}

Async.RunSynchronously main</code></pre>
    </td>
  </tr>

  <tr>
    <td>非同期処理を同期的に処理する方法</td>
    <td><code>asyncio.run(func())</code></td>
    <td><code>Func().GetAwaiter().GetResult()</code></td>
    <td><code>task.Wait()</code> または <code>task.Result</code></td>
    <td><code>Async.RunSynchronously</code></td>
  </tr>
</table>


## F#の補足

### return!

次の二つは同じ。返り値の型はともに`Task<string>`。return!はショートカットのようなもの。

```fsharp
let sayHello name =
    task {
        return $"Hello, {name}"
    }

let greet name =
    task {
        let! msg = sayHello name
        return msg
    }

let greet name =
    task {
        return! sayHello name
    }
```

次のように書くと、返り値の型は`Task<Task<string>>`になってしまう。
```fsharp
let greet name =
    task {
        return sayHello name
    }
```

`async {}`にしても同じだが、返り値の型は`Async<string>`。


### Task<'T>とAsync<'T>の変換

```fsharp
let myTask : Task<string> = Async.StartAsTask myAsync

let myAsync : Async<string> = Async.AwaitTask myTask
```