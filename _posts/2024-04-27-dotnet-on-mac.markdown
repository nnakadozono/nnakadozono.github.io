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


