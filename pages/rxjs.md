---
layout: page
title: RxJS
---

#### References
* [RxJS](https://rxjs.dev/)
* [RxMarbles: Interactive diagrams of Rx Observables](https://rxmarbles.com/#interval)
* RxJS を学ぼう – PSYENCE:MEDIA
  * [RxJS を学ぼう #1 – これからはじめる人のための導入編 – PSYENCE:MEDIA](https://blog.recruit.co.jp/rmp/front-end/rxjs-intro/)
  * [RxJS を学ぼう #2 – よく使う ( と思う ) オペレータ15選 – PSYENCE:MEDIA](https://blog.recruit.co.jp/rmp/front-end/post-11475/)
  * [RxJS を学ぼう #3 – 知ってると便利な ( かもしれない ) オペレータ 8選 – PSYENCE:MEDIA](https://blog.recruit.co.jp/rmp/front-end/post-11539/)
  * [RxJS を学ぼう #4 – COLD と HOT について学ぶ / ConnectableObservable – PSYENCE:MEDIA](https://blog.recruit.co.jp/rmp/front-end/post-11558/)
  * [RxJS を学ぼう #5 – Subject について学ぶ / Observable × Observer – PSYENCE:MEDIA](https://blog.recruit.co.jp/rmp/front-end/post-11951/)
  * [RxJS Quick Start with Practical Examples - YouTube](https://www.youtube.com/watch?v=2LCo926NFLI)

  
#### What is RxJS?
* RxJS = **Reactive Extensions library for JavaScript**
* RxJS is a library for **reactive programming** using **Observables**, to make it easier to compose **asynchronous** or callback-based code.

#### What is Reactive programming?
* MicrosoftがC#向けのライブラリとして開発した。他の言語にも移植されている。
> In computing, reactive programming is a declarative (宣言型) programming paradigm concerned with data streams and the propagation of change. [Reactive programming - Wikipedia](https://en.wikipedia.org/wiki/Reactive_programming)

#### What is Reactive Extensions (ReactiveX)?
* [ReactiveX](https://reactivex.io/)
  > ReactiveX (also known as Reactive Extensions) is a software library originally created by Microsoft that allows imperative (命令型) programming languages to operate on sequences of data regardless of whether the data is synchronous or asynchronous. 

  > It provides a set of sequence operators that operate on each item in the sequence. It is an implementation of reactive programming and provides a blueprint for the tools to be implemented in multiple programming languages. [ReactiveX - Wikipedia](https://en.wikipedia.org/wiki/ReactiveX)


#### What is Observable?
* [RxJS - Introduction](https://rxjs.dev/guide/overview)
> RxJS is a library for composing asynchronous and event-based programs by using observable sequences. It provides one core type, the Observable, satellite types (Observer, Schedulers, Subjects) and operators inspired by Array methods (map, filter, reduce, every, etc) to allow handling asynchronous events as collections.

* Observables are lazy Push collections of multiple values.

|           | SINGLE   | MULTIPLE   |
| ----------| -------- | ---------  |
| **Pull**  | Function | Iterator   | 
| **Push**  | Promise  | Observable |


#### The essential concepts in RxJS which solve async event management

* **Observable**: represents the idea of an invokable collection of future values or events.
* **Observer**: is a collection of callbacks that knows how to listen to values delivered by the Observable.
* **Subscription**: represents the execution of an Observable, is primarily useful for cancelling the execution.
* **Operators**: are pure functions that enable a functional programming style of dealing with collections with operations like map, filter, concat, reduce, etc.
* **Subject**: is equivalent to an EventEmitter, and the only way of multicasting a value or event to multiple Observers.
* **Schedulers**: are centralized dispatchers to control concurrency, allowing us to coordinate when computation happens on e.g. setTimeout or requestAnimationFrame or others.


#### What is a subscription?
* Observableは下流でsubscribeすることで初めて値が流れる
> A Subscription is an object that represents a disposable resource, usually the execution of an Observable. A Subscription has one important method, unsubscribe, that takes no argument and just disposes the resource held by the subscription.

#### What does a trailing dollar sign on a variable name mean in Observables?
[angular - What does a trailing dollar sign on a variable name mean in rxjs/Observables scope? - Stack Overflow](https://stackoverflow.com/questions/63402720/what-does-a-trailing-dollar-sign-on-a-variable-name-mean-in-rxjs-observables-sco)


#### What is important operators?
* [RxJS を学ぼう #2 – よく使う ( と思う ) オペレータ15選 – PSYENCE:MEDIA](https://blog.recruit.co.jp/rmp/front-end/post-11475/)
* [RxJS を学ぼう #3 – 知ってると便利な ( かもしれない ) オペレータ 8選 – PSYENCE:MEDIA](https://blog.recruit.co.jp/rmp/front-end/post-11539/)
* [RxMarbles: Interactive diagrams of Rx Observables](https://rxmarbles.com/#interval)

* **Observable.of**: 引数に渡された値をそのまま流して終了するだけのObservableを生成する
* **Observable.from**: 配列といったIterableな引数をとり、それらを順番に流すObservableを生成する
* **Obervable.interval**: setIntervalのように指定された間隔ごとに値を流すObservableを生成する
* **Observable.map**: 任意の関数をObservableソースによって生成され流れてくる値に適用し、その戻り値を再びObservableとして返す
* **Observable.mapTo**: 流れてくる値を毎回同じ固定値にして返す
* **Observable.scan**: Observableソースから流れてきた値に何かしらの処理(アキュムレータ関数)を適用してその結果を Observableとして返します。前回流れてきた値、すなわち前回までの累積結果(中間結果)も一緒に流れてくる
* **Observable.switchMap**: Observableソースから値が流れ出す(A)を起点として別のObservable(B)を流す。その際に起点として流れてきた値AをObservable(B)は引数として受け取る事ができる
* **Observable.filter**: 任意のフィルタリング関数を流れてくる値に適用してtrueとなるものだけをObservableとして返す
* **Observable.skip**: Observableソースから流れてくる値のうち、指定した数(回数)をスキップする
* **Observable.take**: Observableソースから流れてくる値のうち、指定した数(回数)だけ受け取る。全て受け取るとcomplete イベントが発火する。
* **Observable.distinctUntilChanged**: Observableソースから来る全ての値のうち、前回の値から変化したものだけを流す
* **Observable.merge**: 可変長引数で複数のObservableを受取り、各Observableに値が流れてくる度にそれをそのまま流す
* **Observable.startWith**: 指定した引数の値をObservableソースにから来る値より先に流す
* **Observable.combineLatest**: 可変長引数で複数の Observable を受け取り各Observableに値が流れる度にその値と他の Observableの直近の値を一緒に流す
* **Observable.do**: Observableソースから流れてくる全ての値に対して任意の処理(副作用)を実行する。戻り値はソースから流れてきたObservableそのまま
* **Observable.never**: 何の値も流さないObservableソース。nextもcompleteも発火しない。テスト目的や他のObservableとの合成する必要があるときなどで使うことがある。必須の引数に値を渡したいけどまだ実装されていなかったり、ある特定の条件下では渡す値が無いといった場面での仮の値として使われる
* **Observable.delay**: Observableソースから来る値が流れるのを遅らせる
* **Observable.switch**: Observableの内部にあるObservable(Observable<Observable<T>>)をflatにする。flatMapとの違いは、switchはそれまで流れてたもの(内部Observable)をキャンセルして後から来るObservableへとスイッチする。
* **Observable.throttle**: 最初のイベントを処理した後に続く同様のイベントを指定した時間は間引き、時間経過後に処理を実行する
* **Observable.throttleTime**: throttleが引数にObservableを取ることによって間引き時間を指定したのに対し、throttleTimeは数値型(ミリ秒)を受け取って指定する
* **Observable.debounce**: throttleが指定した時間の間は同一イベントを処理しないのに対し、debounceは指定した時間内に同一イベントが発生すると処理せず、発生しなければ処理を実行する
* **Observable.partition**: Observableソースを二つに分割するオペレータ。filterがtrueとなる値だけを返すのに対して、partitionはtrueとなる値とfalseとなる値のObservableを配列で返す


#### What is an Observer?
[RxJS - Observer](https://rxjs.dev/guide/observer)
> An Observer is a consumer of values delivered by an Observable. Observers are simply a set of callbacks, one for each type of notification delivered by the Observable: `next`, `error`, and `complete`. The following is an example of a typical Observer object:

> Observers are just objects with three callbacks, one for each type of notification that an Observable may deliver.


#### What are cold and hot?
* **COLD**: subscribeされるまで値を流さない. それぞれの Observer に対して個別に値を流す. 
* **HOT**: subscribe されなくとも値を流す. ストリームを分岐させて一度に同じ値を流す.

#### What is a Subject?
> An RxJS Subject is a special type of Observable that allows values to be multicasted to many Observers. While plain Observables are unicast (each subscribed Observer owns an independent execution of the Observable), Subjects are multicast.

> A Subject is like an Observable, but can multicast to many Observers. Subjects are like EventEmitters: they maintain a registry of many listeners.

> Subject = Observable + Observer
Read [RxJS を学ぼう #5 – Subject について学ぶ / Observable × Observer – PSYENCE:MEDIA](https://blog.recruit.co.jp/rmp/front-end/post-11951/)!!


#### How is the RxJS used in Angular?
> AngularJS ( 1.x 系 ) では複数ページ間やディレクティブ ( コンポーネント ) 間でのデータの受け渡しないしイベントディスパッチのために $rootScope を使用するケースがあります。しかし後継である Angular ( 2 系 ~ ) にはそのような組み込みの機能がないため、代わりに Subject を使って値を流します。
[RxJS を学ぼう #5 – Subject について学ぶ / Observable × Observer – PSYENCE:MEDIA](https://blog.recruit.co.jp/rmp/front-end/post-11951/)


#### Food for thought
* [【翻訳】あなたが求めていたリアクティブプログラミング入門 - ninjinkun's diary](https://ninjinkun.hatenablog.com/entry/introrxja)
* [「RxJS」初心者入門 - JavaScriptの非同期処理の常識を変えるライブラリ &#124; 株式会社LIG(リグ)](https://liginc.co.jp/web/js/151272)
