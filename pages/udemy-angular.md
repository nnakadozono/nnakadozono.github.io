---
layout: page
title: Angular - Udemy
---

# [Udemy] はじめてのAngular入門 実践シングルページアプリケーション（SPA）開発

https://www.udemy.com/course/angular-ja/


1. はじめに
2. 初めてのAngularアプリケーションを作成しよう
3. TypeScriptに慣れよう
4. 社員管理アプリケーションを作成しよう
5. RxJSを理解しよう
6. Angular CLIを使いこなそう
7. チャットアプリケーションを作成しよう
8. 終わりに

## 1. はじめに


## 2. 初めてのAngularアプリケーションを作成しよう
* node.js
* Angular CLI
  * $ npm install -g @angular/cli
* VS Code
  * Angular Essentials
  * Angular2-inline
  * Angular2 TypeScript Emmet
  * TypeScript Importer

## 3. TypeScriptに慣れよう

## 4. 社員管理アプリケーションを作成しよう
* $ ng new admin-app
  * routing > no
  * style > CSS
* $ npm start
  * package.json内のscriptsフィールドで、何をしているかを確認できる。
    * ng service: アプリケーションのビルド、ローカルサーバーの立ち上げ、アプリケーションの変更監視を実施するコマンド
  * localhost:4200
* $ ng generate component members
  * ngOnInit(): ライフサイクルメソッドの一つ. コンポーネントが初期化されるタイミングで実行される
* <h2>{{ member.name }}</h2>
* <input type="text" [(ngModel)]="member.name" placeholder="名前">
  * ngModel: formでのデータのやりとりを行うための書き方
  * 双方向データバインディング
  * FormsModule
* app.module.ts
  * Angularの機能はモジュールという単位で分割されている。その機能を使う場合にはimportして、アプリケーションに適用する必要がある。
  * @NgModuleデコレータのimportsに追加する。
* <li *ngFor="let member of members">
  * ディレクティブ。*は構造ディレクティブであることを表す。
  
37
* (click) イベントバインディング
* *ngIf
* [class.selected]=*condition*:　クラスバインディング。"selected"というクラスを付与する
* 変数が初期化されていないというエラーが出るので、tsconfig.jsonに次を追加した。
  * "strictPropertyInitialization": false
  * https://stackoverflow.com/questions/49699067/property-has-no-initializer-and-is-not-definitely-assigned-in-the-construc

38
* component作成
  * ng generate component member-detail
* componentにpropertyを渡す: [property]="varname"
* @Input: @Inputデコレータ。InputというクラスをAngular CoreからImportする必要がある。

39 Service
* componentはデータの受け渡しだけをする
* serviceはデータ取得やデータ整形などのビジネスロジックをする
* Serviceの作成
  * ng generate service member
* @Injectableデコレータを使用して作成されている。サービスがアプリケーションの中のどこで使われるかを指定する。providedInを指定しない場合は、利用するところで個別に設定する必要がある。providedIn:'root'はどこからでも参照できる。
* Serviceを利用するためには、importして、constructorで**Dependency Injection**をする。component間の依存性を解決して、外部のクラスを簡単に利用できるようにするデザインパターン。
  * constructor(private MemberService: MemberService) { }
  * private: 自身のプロパティとして取り込むため
* ngOnInitでgetMembersする。
  * constructorの中では自身のプロパティを初期化するためだけに使う。外部からのデータ呼び出しはngOnInitでするのが望ましい。
  * ngOnInitはcomponentが初期化される段階で呼び出される、ライフサイクルメソッドの一つ。

* getMembersはサーバーとのやりとりを考慮して、非同期処理にする
* rxjsの機能を利用すると非同期処理が簡単に記述できる。
  * Observableオブジェクト, 
  * of: 実行の際に渡した値をObservableというオブジェクトに変換して返す関数
  * subscrbeメソッド: of関数で渡された値を受け取れる

* Service
  * constructor(public messageService: MessageService) { }
  * messageServiceをtemplateから参照するためにpublicとした。

* template文字列: ``で囲む。${var}で変数を参照できる。

### Routing
**44. Routing**
* Routing: URLを設計すること
* ng generate module app-routing --flat --module=app
  * angularのroutingはroutingモジュールで設定する。名前に-routingをつける。
  * --flat: directoryの直下にフォルダを作らず、直接ファイルをつくる。
  * --module=app: AppRoutingModuleをapp.module.tsに追加
* app-routing.module.ts
  * import { RouterModule, Routes} from '@angular/router'
  * const routes: Routes = [{ path: 'members', component: MembersComponent }]
    * membersというpathを指定したときに、componetが呼ばれる
  * imports: [RouterModule.forRoot(routes)]
    * RouterModuleというroutingを行う機能をapplication全体に適用する際にルート情報を渡してroutingを有効にするという指定
  * exports: [RouterModule]
    * Routing moduleが読み込まれるapp moduleの方で、routingの機能を使えるようにする
  * app.component.htmlでcomponentを<router-outlet>におきかえる。
    * ここに、先程指定したcomponentが挿入される。

**45. Dashboard**
* Angularのroutingを利用してSPAにするためには、<a>ではhrefではなくrouterLinkを使用する
  * <a routerLink="/members">社員一覧</a>
* routeのリダイレクト設定
  * { path: '', redirectTo: '/dashbaord', pathMatch: 'full'},
  * pathMatch: 'full': pathに完全一致しているか

**46. 社員詳細ページ**
* :idとすることでAngularのrouterの機能からこのidというパラメーターで値を参照できる。
  * { path: 'detail/:id', component: MemberDetailComponent },

**47. 社員詳細データ**
* private route: ActivatedRoute,
  * URLのパラメーターやハッシュフラグメントを取得するためのサービス (@angular/router)
  * const id = this.route.snapshot.paramMap.get('id');
* private location: Location
  * ブラウザバックやページを進むなどのブラウザの機能をAngularを通して使うためのサービス (@angular/common)
* 戻るボタン
  * this.location.back();
  * windowオブジェクトのヒストリーバックを使うこともできるが、Angularのrouterが正しくroute情報を保存できないため、location serviceを使うのが望ましい。

### HTTPクライアント 
**48**
* import { HttpClientModule } from '@angular/common/http'

* angular-in-memory-web-api: データサーバをsimulateするAPI
* npm install angular-in-memory-web-api@0.11.0 --save
  * I got ERESOLVE unable to resolve dependency tree
  * npm install angular-in-memory-web-api@0.14.0 --save
* import { HttpClientInMemoryWebApiModule } from 'angular-in-memory-web-api';

* ng generate service in-memory-data

* ofの代わりにreturn this.http.get<Member[]>(this.membersUrl);とした。返り値は変わらずObservable
  * AngularのHttpクライアントのメソッド自体がrxjsを利用して実装されているため。

**51 エラーハンドリング**
* observableはpipeというメソッドをつかって、データを受け取るまでの中間処理を設定できる。
* pipeメソッドの中では、rxjsのオペレータという中間処理用の関数を指定することで、指定した関数を順番に実行できます。
* catchError(xxx): エラーだった場合にxxxを実行する
* tap(): 受け取った値を確認するための関数。Used to perform side-effects for notifications from the source observable

**52, 53, 54 変更、追加、削除**
* return this.http.put(this.membersUrl, member, this.httpOptions)
* <input type="text" #memberName>
  * #xxx Angularのテンプレート変数の書き方。memberNameという名前でインプットタグを直接参照できる。
* return this.http.post<Member>(this.membersUrl, member, this.httpOptions)
* subscribe(); 何もしなくても必要。subscribeすることで、はじめてhttp requestが実行される。Observableでデータを受け取る際には必ずsubscribeメソッドの実行が必要。

**55, 56 検索**
* <li *ngFor="let member of members$ | async"></li>
* member$にはObservableを格納する予定。Observableをテンプレートでsubscribeできるのがasyncパイプ
* asyncパイプを使うとtsでsubscribeしなくても、テンプレートの中でsubscribeして、値を取得できる
* asyncパイプはpromiseオブジェクトもテンプレートで解決できる。
* 検索結果を受け取ったタイミングでビューにデータを反映するため、非同期で受け取るデータも簡単に処理できる。

* Subjectクラス: Observableのデータを流すためのrxjsクラス。Observableを継承したクラス
  * nextメソッドをもっており、実行すると、渡したデータをパイプで指定している中間処理を通して、subscribeしている部分にデータを送れる
  * 任意のタイミングでデータを送りたいときに使う
* debounceTime: キーボードの入力のあとにしばらくまって次の実行に移る
* distinctUntilChanged: 直前のデータと同じ場合は処理を実行しない。次の処理を実行しない。
* switchMap: 検索キーワードを受け取るたびに新しいObservableを返す


### Lifecycle Hooks
https://blog.yuhiisk.com/archive/2020/08/30/angular-lifecycle-hooks.html



## 5. RxJSを理解しよう
* 非同期処理を管理するためのJSライブラリ。
* Reactiveプログラミングに基づく。
  * 流れてくるデータ(ストリーム)に対して、関連性と操作を"宣言"的に記述するプログラミング手法
* Observable: 川の流れ
* オペレータ: 中間処理をする仕組み
* Subscribeメソッドでデータを受け取る
  * 第1引数: データを受け取った際のcallback
  * 第2引数: エラー時のcallback
  * 第3引数: 処理完了時のcallback
* asyncパイプ: テンプレートでデータを受け取る

* angular.json
  * "start": "ng serve --open"

**Operator**
* map: ストリームで流れてきたデータを受け取って違うデータを返す
* filter: データ検証。流れてきたデータに対して、データチェックをする。条件に合う時のみ下流に流す
* debounceTime: 連続してデータがストリームに流れた場合に、最後の処理から指定した秒数だけ遅延した後に一度だけデータをストリームする
* throttleTime: 連続した処理の最後ではなく、中間処理を指定した時間間隔で間引くことができる。
* distinctUntilChanged: 前回と流れてくるデータが違う場合のみデータを流す
* switchMap: ストリームAに流れてくるデータをもとにストリームBを流す
  * オブザーバルブルが返している処理が完了しない間に、新しくストリームでデータが流れてきた場合は実行されていたストリームBの処理は破棄されて、また流れてきたデータを受け取ってBが実行される
* skip: 指定した回数分ストリームに流さずにスキップする
* take: 指定した回数分実行される。実行回数以降はストリームにデータは流れない
* finalize: 引数で渡したcallback関数をストリームが流れた最後に行なう

* RxJS Marbles: 視覚的に紹介しているサイト

* Subject
  * Observableはsubscribeしたタイミングでデータが流れる。Observableではデータを流すことは一度だけ。
  * アプリケーション開発をしているときは、任意のタイミングでデータを流したい場合が度々でてくる。
* Observableを継承しているクラスで、任意のタイミングでデータを流せる特徴をもつ
* Observer: subscribeする際のcallbackを含むオブジェクト。イベントリスナーのようなもの。サブジェクトはそのイベントリスナーの配列を保持する。
* Angular開発では、ObservableよりもSubscjectを利用することのほうが多い。
* Serviceで初期化。各componentからservice経由でsubjectを監視する。そして、任意のタイミングでSubjectがストリームにデータを流して各componentに通知する。
  * Service
    * private searchTerms = new Sbject<string>();
    * public searchTerms$ = this.searchTerms.asObservable();
    * public search(term: string): void {
        this.searchTerms.next(term);
    }
    * nextでデータが流れる。引数に指定したデータがストリームに流れる。
    * componentから参照できるように、SubjectのasObservableメソッドを利用してobservableを取得する。これをpublicしておけば、直接nextメソッドが呼べないため、コードの複雑化が防げる。
  * Component
    * constructor(
      private searchService: SearchService,
      private memberService: MemberService
    ) {}

    * search(term: string): void {
      this.searchService.search(term);
    }
    * ngOninit(): void {
      this.members$ = this.searchService.searchTerms$.pipe(
        decounceTime(300),
        distinctUntilChanged(),
        switchMap((term: string)) => this.memberService.searchMembers(term)),
      )
    }

## 6. Angular CLIを使いこなそう
* $ ng command name --option=value
  * ng new: create application
  * ng generate: create component, etc
  * ng version: check CLI version
  * ng serve: launch local server
  * ng build: create build files
    * distディレクトリが作成される
    * --prod: production
    * src/environments/environments.prod.tsに書いてある設定が有効になったりと、環境変数を変更できるoption
  * ng, ng help, ng new --help: show help
* angular.json: 設定ファイル

**ng new**
* installされたpackageはnode_modulesにインストールされる
* --routing=true
* --style=scss
* --skipInstall
* --prefix=xxx: app.component.tsのselector. 2文字から4文字程度
* --skipTests: spec.tsを自動的には生成しないようにする
* --minimal: 学習用に、テストファイルは出力しない。
* --help

**ng generate**
* ng generate subcommand name
* subcommand: 15種類程度 (component, module, pipe, service, class, enum, interface)
  * ng generate subcommand folder/name
  * name: 小文字、区切りは-
  * app.module.tsに自動的に挿入される
component
* --inlineTemplate
* --inlineStyle
* --prefix=xxx: componentのselectorの接頭辞
* --skipImport: app.module.tsでdeclarationsに自動的にcomponentが挿入されるのをやめる
* --flat: directoryを作成しない
* --skipTests: spec.tsを作成しない
service
* --flat=false: defaultはtrue

**ng serve**
* ローカルサーバーが立ち上がり、変更の自動管理をする(LIVEリロード、ホットリロード)
* projectを指定できる
  * Angularはwork spaceという単位でapplicationを作成する
  * applicationの中でprojectをいくつも追加できる
* package.jsonのstartコマンドにdefaultで指定されている。npm start => ng serve
* --open: 既定のブラウザが自動的に立ち上がる
* --host: defaultはlocalhost
  * --host=0.0.0.0 --disableHostCheck: disableHostCheckは許可していない通信接続の制限を解除できる。ネットワークに接続されている状態であれば、192.168.xx.xx:4200などで接続できるようになる。他のデバイスにも接続できる。開発中に違うPCやスマホのブラウザで表示を確認したくなった場合に、簡単に表示確認ができる。セキュリティに注意
* --port=xxx: defaultは4200
* angular.jsonにserveセクションがある。optionsで指定できる。

**ng build**
* html, css, javascriptファイルの静的ファイルが生成される。生成されたファイルをサーバーにホストすることでAngular Applicationを動かすことができる。
* dist/
* optionを、ng buildをターミナルで実行するときか、angular.jsonのbuildの項目のところで指定できる。
* --configuration=: build設定を切り替える。未指定 or production。angular.json内で指定可能。環境設定の指定やファイルサイズの最適化や高速化のオプションなど。
* --prod: --configuration=production
* --watch: ファイルの変更監視


## 7. チャットアプリケーションを作成しよう
* ng new angular-chat --prefix=ac
* npm install bootstrap@4.5.0 --save
  * angular.jsonのbuild>stylesに追加
* package.json
  * "start": "ng serve --open"

* ng generate class class/comment

* Form - textarea
  * [(ngModel)]とnameを指定する。nameがないとdata bindingが行われないので注意する。
* DatePipe
  * value | date:'medium'
  * value | date:'yyyy年MM月dd日 HH:mm'
* カスタマイズpipe
  * ng g pipe pipes/comment-date

**78- Firebase**
* Webやモバイルアプリ開発に必要な機能を提供するGoogleのサービス
  * ユーザー認証、サイトホスティング、データベース、クラウドストレージなど多くの機能を提供している。
  * authentication, realtime database, hosting
  * naoyuki.nakadozonoで作成した。
* npm install -g firebase-tools@9.12.0
  * ターミナル上でfirebaseの操作を行なうためのライブラリ
  * firebase login

* angularfire: angular公式のfirebaseライブラリ
  * firebaseライブラリをrxjsで扱えるようにしたangular公式のラッパーライブラリ
  * ng add @angular/fire@6.0.2


  


* package.json
* angular.json
* package-lock.json
* tsconfig.json


## 8. 終わりに

## Appendix
node_modules/ 以外を受け渡しすればOK. npm installする。

