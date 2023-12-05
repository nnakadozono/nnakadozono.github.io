---
layout: page
title: Terraform
---

## 参考文献
* [Terraform for さくらのクラウド スタートガイド （第一回） ～インストールから基本操作 ～ | さくらのナレッジ](https://knowledge.sakura.ad.jp/7230/)
* [Terraform for さくらのクラウド スタートガイド （第二回） ～便利なビルトイン機能～ | さくらのナレッジ](https://knowledge.sakura.ad.jp/7550/)


## Infrastructure as Code
APIなどを用いてプログラム = コードでインフラ調達や環境構築などを行う取り組み。ChefやAnsible、Terraform。調達するインフラをコード化したり、サーバやデータベースなどの構成管理をコード化できる。

## Terraform
**インフラの構築、変更、バージョンの管理をコードで行うためのコマンドラインツール**。ここでいうインフラとは、コンピューティングリソースやストレージ、ネットワークといった基本的な部分から、ロードバランサーやDNS、データーベース、CDNといった応用的なものまでを含む、システムを構成する基盤の事を指す。開発はVagrantやPacker、Consulといった製品を開発している**Hashicorp**社が主体となって行われており、GitHubにてオープンソース・プロジェクトとして進められている。

## 定義ファイル(.tf)
* `Terraform`コマンドを実行するとカレントディレクトリにあるすべての **.tf** ファイルを読み込む(サブディレクトリの.tfファイルは読み込まない)。これを利用して.tfファイルを分割することもできる。
* 定義に基づいて、リソース間の関係を表すグラフを構築される。これにより、特定のリソースを修正した場合の影響範囲の算出や、関連のないリソース構築作業の並列化が行える。
* **HCL**というJSONライクなコードで定義する。

### プロバイダー
インフラを管理する対象プラットフォーム。AWS, Azure, GCPなど。
```
provider "provider_name" {
  access_key = "..."
  secret_key = "..."
  region = "ap-northeast-1"
}
```

### リソース定義
```
resource "リソースタイプ" "リソース名" {
  属性名 = 属性の値
}
```
* **リソースタイプ**: 対象のリソースの種別。"aws_", "google_"などのプレフィックスを持つ。
* **リソース名**: リソースの識別子。任意の名前をつけられる。
* 他リソースの情報の参照: `${aws_instance.example}`

### リソースの属性の参照、変数の展開、組み込み関数の呼び出し
`${リソースタイプ.リソース名.属性}`


### プロビジョニング
* 作成したリソースに対して実施する、ファイルのアップロードや任意のソフトウェアのインストールなどの初期設定
* "local-exec"(terraformを実行するマシン上), "remote-exec"(インスタンス上), "file"(ファイルのアップロード)
* `terraform apply`の実行により行う。リソースの作成時のみ。

```
provisioner "local-exec"{
  command = "echo ${aws_instance.example.public_ip} > ip_address.txt"
}
```

### 変数
* `variables.tf`: ファイル名は任意。変数には`${var.変数名}`で参照。
* List型: [..., ..., ...]. 
* Map型: {key1 = "value1" key2 = "value2" }
``
```
variable "変数名" {デフォルト値}
```

* 変数の設定方法
  1. コマンドライン上で対話的に設定
  1. コマンドライン上で`-var`フラグで指定
  1. .tfvarsファイルで設定： **terraform.tfvars**というファイル名は自動で読み込まれる。`access_key = "foo"`。`-var-file`で任意のファイル名を指定できる。
  1. 環境変数で設定: "TF_VAR_変数名"。各プロバイダ/リソースによっては、直接環境変数を利用してくれる属性もある。


## terraformコマンド
主要コマンド
* `terraform plan`: 実行計画の表示。「-/+」破棄し再作成。「~」インプレースアップデート。
* `terraform apply`: 適用
  * **terraform.tfstate**ファイル: `apply`によって作成される状態ファイル。非常に重要。作成したリソースのIDや取得/算出した属性の値などが格納される。Terraformはこのファイルを参照することで、tfファイルで定義されたリソースに対し追加/更新/削除のどの操作が必要なのかを判定する。
* `terraform plan -destroy`: 破棄計画の表示。
* `terraform destroy`: リソースの破棄

その他のコマンド
* `terraform remote`: 状態ファイルを共有するための仕組み
* `terraform graph`: 依存関係の確認 by dot言語 (Graphviz)
* `terraform show`: リソース情報の確認。全属性が出力される。
* `terraform output`: アウトプットの確認。output指定したものを出力。
  * `output "ip" {value = "${aws_eip.ip.public_ip}"}`

## その他
* [terraform 0.14.0 terraform.lock.hclはレビュー時に理解必須なので要約してみた #Terraform - Qiita](https://qiita.com/nyamada43/items/b8becb672ad572897c25)
  * Terraformが作業ディレクトリの.terraformサブディレクトリにキャッシュする様々なアイテムのロックファイルとのこと。バージョン管理に含めるべき。





