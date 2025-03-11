---
layout: page
title: Apache (on Ubuntu)
---

## Apacheとは？
Apache（Apache HTTP Server）は、世界で最も広く使用されているオープンソースのWebサーバーの1つ。柔軟性が高く、モジュールを追加することで機能を拡張できる。静的なWebサイトの配信から、動的なアプリケーションのサポートまで幅広く対応可能。

Nginxはリバースプロキシや高負荷環境に強く、Apacheはモジュールの多様性や柔軟な設定が強み。環境に応じて適切なWebサーバーを選択することが重要。

## Apacheの設定ファイル
Apacheの設定ファイルは以下のディレクトリにある。

| 設定内容 | ファイルパス |
|----------|-------------|
| メイン設定ファイル | `/etc/apache2/apache2.conf` |
| 仮想ホスト設定ファイル | `/etc/apache2/sites-available/` および `/etc/apache2/sites-enabled/` |
| モジュール設定ファイル | `/etc/apache2/mods-available/` および `/etc/apache2/mods-enabled/` |
| 環境変数設定ファイル | `/etc/apache2/envvars` |
| ポート設定ファイル | `/etc/apache2/ports.conf` |

## Apacheのコマンド
Apacheのサービス管理やサイトの有効化・無効化は、以下のコマンドで行う。

| 操作 | コマンド |
|------|---------|
| Apacheの起動 | `sudo systemctl start apache2` |
| Apacheの停止 | `sudo systemctl stop apache2` |
| Apacheの再起動 | `sudo systemctl restart apache2` |
| 設定のリロード（変更適用） | `sudo systemctl reload apache2` |
| サイトを有効化（Enable） | `sudo a2ensite example.conf` |
| サイトを無効化（Disable） | `sudo a2dissite example.conf` |
| VirtualHostの状態の確認 | `sudo apachectl -S` |
| モジュールを有効化 | `sudo a2enmod module_name` |
| モジュールを無効化 | `sudo a2dismod module_name` |
| 有効化されているモジュールの確認 | `sudo apachectl -M` |


## Apacheの設定ファイルの基本
Apacheの設定ファイル（`apache2.conf` や仮想ホスト設定ファイル）には、さまざまなディレクティブが記述されている。

設定の適用順は以下の通り。
1. `apache2.conf`（メイン設定）
2. `ports.conf`（ポートの設定）
3. `mods-available/` と `mods-enabled/`（モジュールの設定）
4. `sites-available/` と `sites-enabled/`（バーチャルホスト設定）

`sites-enabled/` の設定が `apache2.conf` の設定を上書きする場合がある。

### バーチャルホスト（VirtualHost）
バーチャルホスト（VirtualHost）は、1つのApacheサーバーで複数のウェブサイトをホストするための機能。

#### 例: バーチャルホストの設定（`/etc/apache2/sites-available/example.com.conf`）
```apache
<VirtualHost *:80>
    ServerName example.com
    ServerAlias www.example.com
    DocumentRoot /var/www/example

    <Directory /var/www/example>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/example_error.log
    CustomLog ${APACHE_LOG_DIR}/example_access.log combined
</VirtualHost>
```

### 主要なディレクティブ
<table>
    <tr>
        <th>設定項目</th>
        <th>設定例</th>
        <th>説明</th>
    </tr>
    <!-- DocumentRoot -->
    <tr>
        <td><code>DocumentRoot</code></td>
        <td>
            <pre><code class="language-apache">DocumentRoot /var/www/html</code></pre>
        </td>
        <td>Webサイトのルートディレクトリを指定します。</td>
    </tr>
    <!-- Alias -->
    <tr>
        <td><code>Alias</code></td>
        <td>
            <pre><code class="language-apache">Alias /static/ "/var/www/static/"
&lt;Directory "/var/www/static"&gt;
    Require all granted
&lt;/Directory&gt;
</code></pre>
        </td>
        <td>特定のURLパスを物理ディレクトリにマッピングします。</td>
    </tr>
    <!-- Proxy -->
    <tr>
        <td><code>ProxyPass</code> / <code>ProxyPassReverse</code></td>
        <td>
            <pre><code class="language-apache">ProxyPass "/api/" "http://localhost:5000/"
ProxyPassReverse "/api/" "http://localhost:5000/"
</code></pre>
        </td>
        <td>Apacheをプロキシとして使用し、バックエンドのサービスへリクエストを転送する設定。</td>
    </tr>
    <!-- Directory -->
    <tr>
        <td><code>Directory</code></td>
        <td>
            <pre><code class="language-apache">&lt;Directory /var/www/html&gt;
    Options Indexes FollowSymLinks
    AllowOverride None
    Require all granted
&lt;/Directory&gt;
</code></pre>
        </td>
        <td>特定のディレクトリのアクセス権を制御します。</td>
    </tr>
</table>

### 主要なモジュール
Apacheのモジュール（Modules）は、Apacheの機能を拡張するためのプラグインのようなもの。これにより、プロキシ機能、セキュリティ強化、圧縮、認証などの機能を追加できる。

| モジュール名 | 説明 |
|-------------|------|
| `mod_rewrite` | URLの書き換えを行う。リダイレクトやSEO対策に利用される。|
| `mod_ssl` | SSL/TLSによるHTTPS通信を提供する。|
| `mod_proxy` | Apacheをプロキシサーバーとして動作させる。|
| `mod_proxy_http` | HTTPプロトコルを用いたリバースプロキシを実現する。|
| `mod_deflate` | コンテンツを圧縮し、通信速度を向上させる。|
| `mod_headers` | HTTPレスポンスヘッダーの制御を可能にする。|
| `mod_auth_basic` | ユーザー認証（Basic認証）を提供する。|
| `mod_autoindex` | ディレクトリの一覧表示を制御する。|



