---
layout: page
title: アーキテクチャ
permalink: /architecture/
---

## 全体概要

![architecture]({{site.baseurl}}/assets/img/architecture_01.png)

## EC-CUBE

v3.0.16を使用します。

## Heroku Addons

|Addon|備考|
|:--|:--|
|Heroku Postgre|**必須**<br/>v9.6を指定ください。EC-CUBE v3.0.x系では Postgres v10は対応しておりません。|
|Heroku Redis|**必須**<br/>EC-CUBEの初期設定ではセッション情報はファイルに格納して管理していますが、Dynoを複数で運用するとセッションを正しく引き継げなくなります。そこでセッション情報を別のデータストアに格納するためRedisを使用します。|
|Cloudinary|**(ほぼ)必須**<br/>画像を管理するためのサービスとして利用することを推奨します。類似するAddonとしては`Bucketeer`があります。<br/>※本リポジトリには含まれておりませんのでカスタマイズが必要となります。|
|SendGrid|**(ほぼ)必須**<br/>メール配信するためのサービスとして利用することを推奨します。<br/>※本リポジトリには含まれておりませんのでカスタマイズが必要となります。|
