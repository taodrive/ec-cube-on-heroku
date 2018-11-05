# EC-CUBE 3.x on Heroku

Heroku上で稼働させるためにカスタマイズしたEC-Cubeです。バージョンは 3.0.16 を使っております。

## インストール

以下のDeployボタンより、Herokuにデプロイしてください。

[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

### 環境変数の設定について

|項目|値|備考|
|:--|:--|:--|
|ENV|`production`|初回インストール時は`dev`から`production`に変更ください|
|DATABASE_SERVER_VERSION|`9.6`||
|ADMIN_USER|`admin`|インストール時に適宜変更ください|
|ADMIN_PASS|`password`|インストール時に適宜変更ください|
|ECCUBE_INSTALL|`0`|(固定値)|

### インストール後処理

環境変数`ECCUBE_INSTALL`を`1`に変更ください。

(アプリケーション管理画面にて、"Settings" -> "Reveal Config Vars"をクリックすると、環境変数を表示できます)

![heroku_setting_configvars](https://user-images.githubusercontent.com/863990/47992749-0a76b900-e131-11e8-9774-7f8339b16cca.png)

## 使用するAddon

* Heroku Postgre(9.6)
* Heroku redis

## heroku pipelineを使う場合

* 各フェーズのアプリケーションで、環境変数`ENV`を切り替えてご利用ください。

    |フェーズ|`ENV`|備考|
    |:--|:--|:--|
    |Review Apps|`dev`|PRからのCreate Review Appで、自動でセットされます|
    |Staging|`staging`||
    |Production|`production`||

## EC-CUBE本体に関するドキュメント

EC-CUBE 3.x の仕様や手順、開発Tipsに関するドキュメントは、[EC-CUBE 3.x 開発ドキュメント@ec-cube.github.io](http://ec-cube.github.io/)にて掲載しています。

### その他

+ パッケージ版をご利用の方は[EC-CUBEオフィシャルサイト](http://www.ec-cube.net)をご確認ください。  
+ EC-CUBEのカスタマイズやEC-CUBEの利用、仕様に関しては[開発コミュニティ](http://xoops.ec-cube.net)をご利用ください。  
+ EC-CUBE本体開発にあたって不明点などあれば[Issue](https://github.com/EC-CUBE/ec-cube/wiki/Issues%E3%81%AE%E5%88%A9%E7%94%A8%E6%96%B9%E6%B3%95)をご利用下さい。
