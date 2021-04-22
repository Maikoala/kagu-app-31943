# **KaGuYa**

## アプリケーション概要
**インテリアショップのショピングモール**<br>
<br>
複数のショップが出店しているため、ショップごとにそれぞれのWebサイトを閲覧する手間がなく、まとめて商品を見ることができます。<br>
また、複数の条件で絞って検索をかけることも可能です。この機能によって、店舗をまたいで見たいカテゴリーや色の商品をピックアップすることができます。<br>
欲しい商品が見つかったら、そのままその場で購入可能です。
<br>
<br>

## URL
**http://54.150.32.69/**
<br>
<br>

## テスト用アカウント
### Basic認証
ID: bulldog<br>
PW: 2121
<br>

### オーナーアカウント
e-mail: mochi@test<br>
PW: mochi007
<br>

### ユーザーアカウント
e-mail: daihuku@test<br>
PW: daihuku007
<br>
<br>

## 利用方法
### オーナー(ショップオーナー、商品出品者)の場合

| ログイン前トップページ                                                 | ログイン後トップページ                                                |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ |
|<img src="https://i.gyazo.com/8973ed0135610c42a0086a2ef113585a.jpg" width="400px">|<img src="https://i.gyazo.com/a13f9517c56c3a2ea4392da221e87315.jpg" width="400px">|

| 新規登録                                                            | ログイン画面                                                         |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ |
|<img src="https://i.gyazo.com/440a335b4ab2b67cce010e0cda1a9423.gif" width="400px">|<img src="https://i.gyazo.com/6d8b8ebabb9fede3c57133ace0751654.jpg" width="400px">|

| Shop登録前オーナーマイページ                                           | Shop登録後オーナーマイページ                                           |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ |
|<img src="https://i.gyazo.com/1b9b477f50b811b2f2769a818e5dd2ce.jpg" width="400px">|<img src="https://i.gyazo.com/59cce7113eb9ba4359261fcf11c2f475.jpg" width="400px">|

| Shop登録ページ                                                       | 商品出品ページ                                                       |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ |
|<img src="https://i.gyazo.com/2c5de2432ad08e7843c83677bf257450.gif" width="400px">|<img src="https://i.gyazo.com/67e60beb0474390e85b69258116e1cc1.gif" width="400px">|

| トップページからショップページへ                                        | ショップページ                                                        |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ |
|<img src="https://i.gyazo.com/e5c7f51020f09faa66ebb84ed9a9837a.gif" width="400px">|<img src="https://i.gyazo.com/b7b18931831241403f2c62923d48b699.gif" width="400px">|

| 商品詳細ページ                                                       | 商品編集ページ                                                        |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ |
|<img src="https://i.gyazo.com/bf665702092818b90c77a5cfc0928a8c.gif" width="400px">|<img src="https://i.gyazo.com/21c09c4006fca988ff36b14e034d4af6.gif" width="400px">|

* **オーナー（ショップオーナー、商品出品者の場合）**
  * トップページから**オーナー新規登録**
  * トップページのオーナの名前のリンクからオーナーマイページへ、マイページでShop登録（shop未登録時のみ）
  * トップページShop一覧から自分のショップを選ぶ or トップページのオーナー名リンクからオーナーマイページへ
  * 出品するボタンを押下し、出品フォームに商品情報を入力し、出品ボタンを押下
  * 出品した商品の変更・削除は、ショップ商品詳細ページからそれぞれボタンを押して編集・削除（ただし、sold out商品については不可）

### ユーザー(商品購入者)の場合

| 新規登録                                                            | ログイン画面                                                         |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ |
|<img src="https://i.gyazo.com/214cb89452da90a052f95b3b419d7147.gif" width="400px">|<img src="https://i.gyazo.com/ca01c32a8c52324e546313e0ad1d1a86.jpg" width="400px">|

| トップページ商品検索・shop一覧                                         | 各ページ商品検索                                                         |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ |
|<img src="https://i.gyazo.com/85b5791fa7d4d64836f7dcf207e7dd1f.gif" width="400px">|<img src="https://i.gyazo.com/53d8151936fc5752908b7c4624f31365.gif" width="400px">|

| 商品詳細画面                                                         | 商品購入画面                                                         |
| ------------------------------------------------------------------ | ------------------------------------------------------------------ |
|<img src="https://i.gyazo.com/ea6d169d7fca77ed53b79a99d00fd491.gif" width="400px">|<img src="https://i.gyazo.com/3df7fc2bbc1001e26b1760f4343c3827.gif" width="400px">|

* **ユーザー（購入者)の場合**
  * トップページから**ユーザー新規登録**
  * トップページの商品検索 or shop一覧から検索
  * ショップのトップページ or 検索結果ページから商品をクリックし、商品詳細ページへ
  * 購入ボタンを押下、フォームにクレジットカード情報と送付先情報を入力し、購入ボタンを押下
  * どのページにも検索フォームが実装されているので、気になった時にすぐに探せる
  * キーワード検索はショップ名、アイテム名、どちらでも可能
<br>
<br>

## 目指した課題解決
20代〜40代をメインターゲットに、家具、インテリアグッズなどの検索・購入を効率化し、時短を図ることで、日々の生活を充実させる。
<br>
<br>

## 機能一覧
| 機能                   | 概要                                                                            |
| --------------------- | ------------------------------------------------------------------------------- |
| オーナー管理機能         | オーナーの新規登録・ログイン・ログアウトが可能                                         |
| ユーザー管理機能         | ユーザーの新規登録・ログイン・ログアウトが可能                                         |
| ショップ登録機能         | ログイン中のオーナーはショップを1店舗だけ登録可能                                      |
| ショップ内商品一覧表示機能 | ショップ内の商品は一覧表示で誰でも閲覧可能                                            |
| 商品出品機能            | ログイン中のオーナーでショップ出店者は、画像付きでそのショップに商品出品が可能               |
| 商品詳細表示機能         | 各商品詳細が詳細ページで誰でも閲覧可能                                                |
| 商品編集・削除機能       | ログイン中のオーナーで商品出品者のみ商品編集・削除が可能                                 |
| 商品購入機能            | ログイン中のユーザーは商品をクレジットカードで購入可能                                   |
| 商品検索機能            | 複数条件を指定して誰でも検索が可能                                                    |
| 商品検索結果一覧表示機能  | 検索結果の商品を一覧表示で誰でも閲覧可能                                               |
| オーナー詳細表示機能     | ショップ未出店のオーナーのショップ出店、ショップ出店済オーナーの商品出品、オーナー情報編集が可能 |
<br>
<br>

## 追加予定機能
| 機能              | 概要                                                          |
| ----------------- | ------------------------------------------------------------ |
| ユーザー詳細表示機能 | 各ユーザーのお気に入り一覧・購入済商品一覧の閲覧、ユーザー情報編集が可能 |
| オーナー情報編集機能 | ログイン中のオーナーでアカウント本人であればプロフィール編集が可能      |
| ユーザー情報編集機能 | ログイン中のユーザーでアカウント本人であればプロフィール編集が可能      |
| 商品画像複数投稿機能 | ログイン中オーナーが自分のショップに商品出店する際、画像を複数選択可能   |
| お気に入り機能      | 各商品に非同期通信でお気に入りをつけることが可能、またその削除も可能     |
<br>
<br>

## ローカルでの動作方法
$ git clone https://github.com/Maikoala/kagu-app-31943.git<br>
$ cd kagu-app-31943 <br>
$ bundle install <br>
$ rails db:create <br>
$ rails db:migrate <br>
$ rails s <br>
http://localhost:3000
<br>
<br>

## 開発環境
- VScode
- Ruby 2.6.5
- Rails 6.0.3.5
- mysql2 0.4.4
- JavaScript
- gem 3.0.3
- AWS　
  - Unicorn 5.4.1
  - Nginx1
  - MariaDB 5.5.68
<br>
<br>

## テーブル設計

## owners テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| account_name       | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana    | string  | null: false               |
| last_name_kana     | string  | null: false               |
| postal_code        | string  | null: false               |
| state_province_id  | integer | null: false               |
| city               | string  | null: false               |
| address_line_1     | string  | null: false               |
| address_line_2     | string  |                           |
| phone_number       | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_one :shop
- has_many :items


## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| postal_code        | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :orders


## shops テーブル

| Column | Type       | Options                                      |
| ------ | ---------- | -------------------------------------------- |
| name   | string     | null: false, unique: true                    |
| info   | text       | null: false, limit: 1500                     |
| owner  | references | null: false, foreign_key: true, unique: true |

### Association

- belongs_to :owner
- has_many :items


## items テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false, limit: 40         |
| info     | text       | null: false, limit: 1500       |
| size     | string     | null: false, limit: 200        |
| color_id | integer    | null: false                    |
| price    | integer    | null: false                    |
| owner    | references | null: false, foreign_key: true |
| shop     | references | null: false, foreign_key: true |
| category | references | null: false, foreign_key: true |

### Association

- belongs_to :owner
- belongs_to :shop
- belongs_to :category
- has_one :order


## categories テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| category_name_id | integer | null: false |

### Association

- has_many :items


## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| first_name        | string     | null: false                    |
| last_name         | string     | null: false                    |
| postal_code       | string     | null: false                    |
| state_province_id | integer    | null: false                    |
| city              | string     | null: false                    |
| address_line_1    | string     | null: false                    |
| address_line_2    | string     |                                |
| phone_number      | string     | null: false                    |
| order             | references | null: false, foreign_key: true |

### Association

- belongs_to :order