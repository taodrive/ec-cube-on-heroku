---
layout: page
title: インストール手順
permalink: /installstep/
---

#### 前提: Herokuアカウントは事前に用意ください。

### ①

以下のHeroku Deployボタンをクリックしてください。

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/takahiro-yonei/ec-cube-on-heroku)

### ②

Heroku App名を入力してください。

※入力した名称が利用可能な場合、緑色の文字で "(アプリ名) is available"と表示されます

![heroku_app_name]({{site.baseurl}}/assets/img/CreateNewAppHeroku_1.png)

### ③

画面下部の方で、環境変数を指定する箇所があります。評価のみの場合は、変更不要ですのでそのままにしてください。Heroku Pipelineに載せる場合には、`ENV`の値を`production`に変更してください。

最後に`Deploy app`ボタンよりデプロイを実行します。

![heroku_config_vars]({{site.baseurl}}/assets/img/CreateNewAppHeroku_2.png)

#### ※環境変数の設定について

|項目|値|備考|
|:--|:--|:--|
|ENV|`dev`,`production`|Heroku Pipelineを利用する場合に使う変数です。<br/>Heroku Pipelineを使う場合、初回インストール時には`production`に変更してください。|
|DATABASE_SERVER_VERSION|`9.6`|v3.0.xでは `9.6` を使用ください。|
|ECCUBE_ADMIN_USER|`admin`|インストール時に適宜変更ください。|
|ECCUBE_ADMIN_PASS|`password`|インストール時に適宜変更ください。|
|ECCUBE_INSTALL|`0`|Heroku Pipelineを利用する場合に使う変数です。`EC-CUBE`本体をインストールしているかどうかを識別するためのフラグで、`0`(未), `1`(済) を意味します。<br/>初回インストール時は`0`のままにしてください。|

### ④

デプロイが完了しますと、

> Your app was successfully deployed

というメッセージが表示されます。`View`ボタンよりEC-CUBE画面を開きます。

![heroku_config_vars]({{site.baseurl}}/assets/img/CreateNewAppHeroku_3.png)

![ec-cube_top]({{site.baseurl}}/assets/img/EC-CUBE_SHOP_TOP.png)

### ⑤ (以降、Heroku Pipelineを使う場合の準備)

先ほどの画面で、`Manage App`ボタンをクリックして、Heroku App管理画面を開き、環境変数を修正します。

下記の画面で、`Settings`タブを開きます。

![heroku_admin_panel_01]({{site.baseurl}}/assets/img/try-ec-cube-201x_Heroku_1.png)

### ⑥

`ECCUBE_INSTALL`欄の横にある編集ボタン(ペンのアイコン)をクリックして、編集画面を開きます。

![heroku_admin_panel_02]({{site.baseurl}}/assets/img/try-ec-cube-201x_Settings_Heroku_2.png)

`Value`を`1`に変更して、保存します。(EC-CUBEがインストール済であることを環境変数としてセットします)

![heroku_admin_panel_03]({{site.baseurl}}/assets/img/try-ec-cube-201x_Settings_Heroku_3.png)

## ※Heroku Pipelineを使う場合

* Heroku Pipelineを作成し、上記で作成したアプリケーションをProductionとして登録してください。
* 同じ手順で、`ENV`の値を`staging`にしてStaging用アプリケーションを作成し、Heroku PipelineにStagingとして登録してください。
* 最終的に、各フェーズのアプリケーションと、環境変数`ENV`は以下の通りとなります。

|フェーズ|`ENV`|備考|
|:--|:--|:--|
|Review Apps|`dev`|Pull Requestから作成される際に自動でセットされます|
|Staging|`staging`||
|Production|`production`||
