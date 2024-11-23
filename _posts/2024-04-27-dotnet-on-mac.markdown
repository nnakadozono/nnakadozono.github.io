---
layout: post
title:  "Dotnet (.NET) on Mac"
date:   2024-04-27 23:59:00 +0900
categories: blog
---
## Installation
1. Install .NET (SDK and Runtime)
    * [.NET | Build. Test. Deploy.](https://dotnet.microsoft.com/en-us/)
    * `/usr/local/share/dotnet/`にインストールされる。`PATH`を追加。
    ```bash
    export DOTNET_ROOT=/usr/local/share/dotnet
    export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
    ```
    * 代わりに`ln -s /usr/local/share/dotnet/dotnet /usr/local/bin`とすると良いとの記述もある。
2. Install related VS Code extensions (`C# Dev Kit`, `Ionide for F#`, and etc)

Reference
* [Install .NET on macOS - .NET | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/core/install/macos)
* [M3 mac環境での dotnet: command not found .NET Core エラー解消方法](https://zenn.dev/unsoluble_sugar/articles/982e38df5ffbd9)


## C#
* [Visual Studio Code の拡張機能である「C# Dev Kit」が GA となったので使ってみた | DevelopersIO](https://dev.classmethod.jp/articles/vscode-csharp-dev-kit/)


## F#
* [Use F# on macOS | The F# Software Foundation](https://fsharp.org/use/mac/)
* [Get Started with F# in Visual Studio Code - .NET | Microsoft Learn](https://learn.microsoft.com/en-us/dotnet/fsharp/get-started/get-started-vscode)
* [VSCodeにF#の開発環境を導入する方法 #VSCode - Qiita](https://qiita.com/Midoliy/items/1aee06ada5c0081c49d1)

* REPL in terminal
```bash
$ dotnet fsi
```
* REPL in VS Code: `Cmd+Shif+P FSI: Start`

### Others
* `Polyglot Notebooks` in VS Code: F#やC#をJupyter Notebookで使える。
* [Rider: The Cross-Platform .NET IDE from JetBrains](https://www.jetbrains.com/rider/promo/?source=google&medium=cpc&campaign=APAC_en_JP_Rider_Search&term=c%23%20mac&content=468065244703&gad_source=1&gclid=CjwKCAjwoa2xBhACEiwA1sb1BDvfZvDut2gjQmMAaW27rLkbNNv9MQkpUayQcCrGQ7Q1v7wrPQAyQhoCeYQQAvD_BwE)

