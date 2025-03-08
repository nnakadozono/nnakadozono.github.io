---
layout: page
title: Dotnet
---
[.NET documentation &#124; Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/)

### What is .NET? (.NET Platform)

> **さまざまな種類のアプリケーションをビルドするためのツール、プログラミング言語、およびライブラリで構成される開発者向けプラットフォーム。**

> 無料でクロスプラットフォームで。複数の言語、エディター、ライブラリを使用して、Web、モバイル、デスクトップ、ゲーム、IoTなど向けにビルドすることができる。
> .NETアプリは、**C#、F#、またはVisual Basic**で記述できる。

> .NET(.NET Platformではなく)というときは、.NET実装の一つで、オープンソース、クロスプラットフォームのものを意味する。

- [.NETとは?](https://dotnet.microsoft.com/ja-jp/learn/dotnet/what-is-dotnet)
- [.NET Frameworkとは何ですか?](https://dotnet.microsoft.com/ja-jp/learn/dotnet/what-is-dotnet-framework)
- See also [.Net とは? - .Net の説明 - AWS](https://aws.amazon.com/jp/what-is/net/)

### What is the implementation of .NET? (.NETの実装)
>　.NETにはさまざまな実装がある。各実装により、.NETコードをさまざまな場所(Linux、macOS、Windows、iOS、Androidなど)で実行できる。
> 1. **.NET Framework**は、.NETのオリジナル実装。**Windows**でWebサイトやサービス、デスクトップアプリなどを実行するサポートを行う。Windowsに含まれている。
> 2. **.NET**は、Windows、Linux、macOSでWebサイト、サービス、コンソールアプリケーションを実行するための**クロスプラットフォーム**の実装。.NETはオープンソース(Github)。.NETは以前、**.NET Core**と呼ばれていた。
> 3. **Xamarin/Mono**は、iOSやAndroidなどすべての主要なモバイルOSでアプリを実行するための.NET実装。
> 
> **.NET Standard**は、.NET実装全体で共通するAPIの正式な仕様。これにより、同じコードとライブラリを異なる実装で実行できる。

- [.NETとは?](https://dotnet.microsoft.com/ja-jp/learn/dotnet/what-is-dotnet)
- [.NET Frameworkとは何ですか?](https://dotnet.microsoft.com/ja-jp/learn/dotnet/what-is-dotnet-framework)

### What is the .NET Framework?
> .NET Frameworkは、**Windowsでアプリケーション**をビルドして実行するためのソフトウェア開発フレームワーク。
> .NET Frameworkは、.NETプラットフォームの一部。.NETのオリジナル実装。
> .NET Frameworkでビルドされたアプリケーションを使用するには、.NET Frameworkをインストールする必要がある。ほとんどの場合、Windows には.NET Frameworkが既にインストールされている。
> 2023年時点でのバージョンは.NET Framework 4.8.1

> .NET Frameworkの2つの主要なコンポーネントは、共通言語ランタイムと.NET Frameworkクラスライブラリである。
> * **共通言語ランタイム (CLR：Common Language Runtime)** は、実行中のアプリケーションを処理する実行エンジン。スレッド管理、ガベージ コレクション、タイプセーフ、例外処理などのサービスを提供する。
> * **クラスライブラリ**には、一般的な機能のための一連のAPIと型が用意されている。文字列、日付、数値などの型を提供する。クラスライブラリには、ファイルの読み取りと書き込み、データベースへの接続、描画などのAPIが含まれている。
>
> .NETアプリケーションは、C#、F#、Visual Basicのいずれかのプログラミング言語で開発される。コードは、言語に依存しない**共通中間言語 (CIL: Common Intermidiate Language)** にコンパイルされる。コンパイルされたコードは、**.dll** または **.exe** のファイル拡張子を持つ**アセンブリ**ファイルに格納される。
> アプリが実行されると、CLRはアセンブリを受け取り、**Just-In-Timeコンパイラ(JIT)** を使用して、実行中のコンピューターの特定のアーキテクチャで実行可能な**マシンコード**に変換する。

* [.NET Frameworkとは何ですか?](https://dotnet.microsoft.com/ja-jp/learn/dotnet/what-is-dotnet-framework)
* [.NET Framework の使用を開始する - .NET Framework &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/framework/get-started/)
* [Get started with .NET Framework - .NET Framework &#124; Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/framework/get-started/?WT.mc_id=dotnet-35129-website#Introducing)

### What is the .NET Core?
> .NETの実装の一つ。今は **.NET** と呼ばれている。クロスプラットフォーム。オープンソース。

### What is the .NET?
> .NETの実装の一つ。かつては **.NET Core** と呼ばれていた。クロスプラットフォーム。オープンソース。

* [.NET (および .NET コア) - 概要と概要 &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/core/introduction)

### What is the .NET Standard?
> .NET実装全体に共通するAPIの正式な仕様
> 2023年現在のバージョンは.NET Standard 2.0

* [.NET Standard &#124; すべての .NET 実装に共通する API](https://dotnet.microsoft.com/ja-jp/platform/dotnet-standard)

### What is the history of .NET? 
> 2002年、MicrosoftはWindowsアプリを作成するための開発プラットフォームである.NET Frameworkをリリースした。現在.NET Frameworkはバージョン4.8であり、Microsoftによって完全にサポートされている。
> 2014年、Microsoftは.NET Frameworkのクロスプラットフォームオープンソースの後継として.NET Coreを導入した。この新しい実装では、.NET Coreという名前がバージョン3.1まで保持された。.NET Core 3.1より後のバージョンには.NET 5という名前が付けられた。新しい.NETバージョンは毎年リリースされ続け、各メジャーバージョン番号は高くなっている。.NET 5 (2020-11), .NET 6 (2021-11) and .NET 7 (2022-11).

* [.NET (および .NET コア) - 概要と概要 &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/core/introduction)
* [.NET Core - Versions of .NET](https://versionsof.net/core/)

### なぜ.NET 4はないのか?
> .NET 5は実質的には.NET Core 4.0に相当するメジャーバージョンアップですが、.NET Frameworkが.NET Coreベースに移行・統合されるため、.NET Core、.NET Framewrok 4.x双方からの継続性を考慮し、.NET 5という名称が採用されたようです。つまり、来年リリースされる.NET 5以降は、.NET Coreと.NET Frameworkが実質統合されることになります。(XamarinとMonoの統合も視野に入れているようです)

* [.net coreと.net framework の違いは何ですか？ - Quora](https://jp.quora.com/net-core%E3%81%A8-net-framework-%E3%81%AE%E9%81%95%E3%81%84%E3%81%AF%E4%BD%95%E3%81%A7%E3%81%99%E3%81%8B)


### What is the ASP.NET?
> 無料。クロスプラットフォーム。オープンソース。.NETとC#を使用してWebアプリとサービスを構築するためのフレームワーク。

> ASP.NETは.NET開発者プラットフォームを、Webアプリを構築するためのツールとライブラリを使用して拡張する。
> * C#またはF#のWeb requestを処理するための基本フレームワーク
> * C#を使用して動的なWebページを構築するためのWebページテンプレート構文 (**Razor**と呼ばれている)
> * モデル ビュー コントローラー (MVC)など、共通のWebパターン向けライブラリ
> * ライブラリ、データベース、ログインを処理するためのテンプレートページを含む認証システム。これには、多要素認証やGoogle、Twitterなどによる外部認証が含まれる。
> * 構文強調表示、コード補完、Webページの開発専用のその他の機能を提供するエディター拡張機能

> ASP.NETを使用する場合、ビジネスロジックやデータアクセスなどのバックエンドコードは、C#、F#、Visual Basicを使用して記述する。

> **ASP.NET Core**は、ASP.NETの、オープンソースでクロスプラットフォームなバージョン

* [ASP.NET &#124; オープン ソースの .NET 向け Web フレームワーク](https://dotnet.microsoft.com/ja-jp/apps/aspnet)
* [ASP.NET とは? &#124; .NET](https://dotnet.microsoft.com/ja-jp/learn/aspnet/what-is-aspnet)

### What is the NuGet?
> NuGet is the **package manager for .NET**. The NuGet client tools provide the ability to produce and consume packages. The **NuGet Gallery** is the central package repository used by all package authors and consumers.

> NuGet パッケージは、拡張子が.nupkgの1つのZIPファイルであり、コンパイル済みのコード(DLL)、そのコードに関連する他のファイル、パッケージのバージョン番号などの情報が記述されているマニフェストが含まれる。

* [NuGet Gallery &#124; Home](https://www.nuget.org/)
* [NuGet とは何か。またどのような働きをするのか &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/nuget/what-is-nuget)

### What is the Paket?
> Paket is a **dependency manager for .NET projects**. Paket enables precise and predictable control over your dependencies. With Paket, you can reference: NuGet packages, Files from Git repositories, and Files from any HTTP resource.

* [What is Paket?](http://fsprojects.github.io/Paket/)

> NuGet did not separate out the concept of transitive dependencies. If you install a package into your project and that package has further dependencies then all transitive packages are included in the **packages.config**. There is no way to tell which packages are only transitive dependencies.
>
> Even more importantly: If two packages reference conflicting versions of a package, NuGet will silently take the latest version (read more). You have no control over this process.
>
> Paket on the other hand maintains this information on a consistent and stable basis within the **paket.lock** file in the solution root. This file, together with the **paket.dependencies** file enables you to determine exactly what's happening with your dependencies.
>
> Paket also enables you to reference files directly from git repositories or any http-resource.

* [NuGet Gallery &#124; Paket 7.2.1](https://www.nuget.org/packages/Paket)

### What is the dotnet (.NET CLI)?
> .NETコマンドラインインターフェイス (CLI)は、.NETアプリケーションを開発、ビルド、実行、発行するためのクロスプラットフォームツールチェーンである。.NET CLIは、.NET SDKに含まれる。

> dotnetコマンドには、次の2つの機能がある。
> * .NETプロジェクトを操作するためのコマンドの提供。
>   * たとえば、dotnet buildを使うと、プロジェクトをビルドできる。各コマンドには独自のオプションと引数が定義されている。すべてのコマンドは、コマンドの使用方法に関する簡単なドキュメントを出力するための--helpオプションをサポートしている。
> * .NETアプリケーションを実行する。
>   * アプリケーションを実行するには、.dllファイルへのパスを指定する。アプリケーションを実行するということは、エントリポイントを見つけて実行することを意味する。コンソールアプリの場合、これはMainメソッドである。たとえば、dotnet myapp.dllをすると、myappアプリケーションが実行される。デプロイオプションについては、.NET アプリケーションのデプロイを参照のこと。

* [.NET CLI &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/core/tools/)
* [dotnet コマンド - .NET CLI &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/core/tools/dotnet)


### What is the dotnet tool?
> .NETツールは、コンソールアプリケーションを含む特別なNuGetパッケージ。
>
> ツールは、NuGetパッケージからインストールされ、コマンドプロンプトから呼び出されるコンソールアプリケーション。ツールは自分で作成することも、サードパーティによって作成されたツールをインストールすることもでる。ツールは、global tools, tool-path tools, and local toolsとも呼ばれる。 

* [.NET CLI &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/core/tools/)
* [.NET のツール - .NET CLI &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/core/tools/global-tools)


### What is the Visual C#?
> Visual C# is an implementation of the C# language by Microsoft.
> An example of a C# compiler that is not Visual C# is the Mono compiler

* [terminology - C# and Visual C#? - Stack Overflow](https://stackoverflow.com/questions/5296058/c-sharp-and-visual-c)

> Visual C#はマイクロソフトによるC#言語処理系の実装であり、Visual Studioファミリーに含まれるC#専用の統合開発環境 (IDE) である。バージョン2010まではVisual C#単体のExpressエディション製品も存在したが、2012以降はすべてのエディションにおいてVisual Studioに統合されている。

* [Microsoft Visual C Sharp - Wikipedia](https://ja.wikipedia.org/wiki/Microsoft_Visual_C_Sharp)


### How to learn to use the Visual Studio?
* [Visual Studio を使用した C# 開発 - Visual Studio (Windows) &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/visualstudio/get-started/csharp/?view=vs-2022)


### What is the WPF (Windows Presentation Foundation)?
> 解像度に依存せず、ベクターベースのレンダリングエンジンを使用し、最新のグラフィックスハードウェアを活用するために構築されたUIフレームワーク。WPFでは、Extensible Application Markup Language (XAML)、コントロール、データバインディング、レイアウト、2Dおよび3Dグラフィックス、アニメーション、スタイル、テンプレート、ドキュメント、メディア、テキスト、タイポグラフィなどの、アプリケーション開発機能の包括的なセットが提供される。WPFは.NETの一部であるため、.NET APIの他の要素を組み込むアプリケーションを構築できる。

* [Windows Presentation Foundation の概要 - WPF .NET &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/desktop/wpf/overview/?view=netdesktop-7.0)


### What is the .NET MAUI?
> 1つのフレームワークで、ネイティブなクロスプラットフォームのデスクトップアプリとモバイルアプリをすべて構築

* [.NET Multi-platform App UI (.NET MAUI) &#124; .NET](https://dotnet.microsoft.com/ja-jp/apps/maui)
* [.NET MAUI とは - .NET MAUI &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/dotnet/maui/what-is-maui?view=net-maui-7.0)


### What is the project for Visual Studio?
> プロジェクトは個々に別々のプログラムを指します。例えばアプリケーション本体とかテストプログラムとか。

### What is the solution for Visual Studio?
> ソリューションは、プロジェクトをまとめた単位です。

[Paket（.NETのパッケージマネージャー）とFAKE（F#のMake）について - anti scroll](https://tategakibunko.hatenablog.com/entry/2019/07/09/123655)


### What is the Program.fs?

### Is the Program.fs working in production?

### 

#### MSDN (Microsoft Developer Network) -> Microsoft Docs (2020-) -> Microsoft Learn (2022-)
**[Microsoft Developer Network - Wikipedia](https://en.wikipedia.org/wiki/Microsoft_Developer_Network)**

Microsoft Developer Network (MSDN) was the division of Microsoft responsible for managing the firm's relationship with developers and testers, such as hardware developers interested in the operating system (OS), and software developers developing on the various OS platforms or using the API or scripting languages of Microsoft's applications. The relationship management was situated in assorted media: web sites, newsletters, developer conferences, trade media, blogs and DVD distribution.

Starting in January 2020, the website was fully integrated with Microsoft Docs (itself integrated into Microsoft Learn in 2022).

MSDN's primary web presence at msdn.microsoft.com was a collection of sites for the developer community that provided information, documentation, and discussion that was authored both by Microsoft and by the community at large.

* [MSDN と TechNet の docs.microsoft.com への移行に関する更新情報 &#124; Microsoft Learn](https://learn.microsoft.com/ja-jp/teamblog/msdn-technet-migration)
* [突然消滅したMicrosoft TechNet／MSDNブログ（日本語）の捜索：山市良のうぃんどうず日記（154） - ＠IT](https://atmarkit.itmedia.co.jp/ait/articles/1906/04/news004.html)


