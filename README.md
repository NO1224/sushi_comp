# アプリケーション
SUSHI COMP

# アプリケーション概要
寿司ネタを飲食した数や種類に応じたサービスが受けられ、ユーザー同士でコメントと評価をすることで、消費の少ない寿司ネタを手に取る機会を増やすことができる

# URL

# テスト用アカウント
- Basic認証ID：admin
- Basic認証パスワード：2222
- メールアドレス：
- パスワード：

# 利用方法
## 決算データ認証
[認証データの規格が不明のため、実装は未定]
1. トップページのヘッダーからユーザー新規登録を行う
2. QRコード読み取りページでレシートにあるQRコードをスマートフォン等のリーダーで認証する。
3. 達成した成績に応じて寿司ネタやサービス覧の表示を切替える。(ユーザーページにおける成績一覧にも追記する)

## 寿司ネタへのコメント・評価
1. 寿司ネタ一覧ページから各寿司ネタの画像をクリックして、詳細ページに遷移する。
2. コメント・評価したければ、コメント・評価のフォームを入力し、投稿ボタンを押す

## お知らせの確認
1. 管理者側から掲載されるお知らせをトップページのお知らせ覧から、もしくはお知らせ一覧ページで確認する。

## 寿司ネタランキングの確認
1. ユーザーが評価した星の数・飲食した数(カウント数合計)に応じて10位までランキングする。
2. 1位、2位、3位はそれぞれ画像のサイズ変更と専用アイコンを表示する。

## マップの確認
1. アプリを起動した端末の位置情報を元にマップを表示する。
2. 半径に応じて寿司店が存在していれば、ピン表示する

# アプリ作成の背景
寿司業界では余った寿司ネタの無駄を無くした廃棄方法については耳にしていましたが、そもそもの話として手に取られにくい寿司ネタを手に取ってもらうためにはどうすれば良いかと考えていました。そこで、食べた寿司ネタの数や種類に応じて割引や抽選券といったサービスを受けられるシステムの存在を思いつきました。こうすることで、消費者と経営者の両方の立場が利潤を受けられる可能性を高められると推測し、その受け皿となる寿司ネタコンプリート用のアプリを開発することにしました。

# 洗い出した要件
[要件定義シート][sheet-1]

[sheet-1]: https://docs.google.com/spreadsheets/d/1f1YfF6rvhqvBqamL6ryubHcgoYz_VfR8e6s1ZiquAOw/edit#gid=982722306

# 実装機能の画像やGIFおよびその説明

# 実装予定の機能
現在、ER図を設計中
今後はフロントの設計を実施予定

# DB設計
## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true | 
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |


### Association
- has_many :comments
- has_many :stars
- has_one :grade
<br><br>

## foodsテーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| sushi_neta_name | string  | null: false | 
| explanation     | text    | null: false |
| category_id     | integer | null: false |
| season_month    | integer | null: false |


### Association
- has_many :grade_foods
- has_many :grades, through: :grade_foods
- has_many :comments
- has_many :stars
<br><br>

## grade_foodsテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| grade  | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |


### Association
- belongs_to :grade
- belongs_to :food
<br><br>

## gradesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| count  | integer    | null: false                    |


### Association
- has_many :grade_services
- has_many :grade_foods
- has_many :foods, through: :grade_foods
<br><br>

## grade_servicesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| grade   | references | null: false, foreign_key: true |
| service | references | null: false, foreign_key: true |


### Association
- belongs_to :grade
- belongs_to :service
<br><br>

## servicesテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| service_content_id | integer | null: false |


### Association
- has_many :grade_services
<br><br>

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| food    | references | null: false, foreign_key: true |
| content | string     | null: false                    |


### Association
- belongs_to :user
- belongs_to :food
<br><br>

## starsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| food    | references | null: false, foreign_key: true |
| star    | integer    | null: false                    |


### Association
- belongs_to :user
- belongs_to :food
<br><br>

## newsテーブル

| Column  | Type   | Options     |
| ------- | ------ | ----------- |
| title   | string | null: false | 
| content | string | null: false |

# 画面遷移図

# 開発環境
- VSCode
- GitHub
# ローカルでの動作方法

# 工夫したポイント
