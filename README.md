# Bookingdam

<img width="1440" alt="スクリーンショット 2020-05-26 21 49 46" src="https://user-images.githubusercontent.com/59726661/82903312-ba25ad00-9f9b-11ea-9b5c-9efe5187182d.png">


## サービスの概要

      Bookingdamは、誰でも使うことができるイベント告知、イベント予約アプリです。
      
      このアプリは、イベント情報を分かりやすく伝えるだけでなく、イベントの予約者名簿を自動で作成してくれます。
      
      予約する際も、イベント予約ボタンを一つ押すだけで手軽にできます。
      
      締め切りを過ぎるとイベント予約とキャンセルができなくなるのでご注意ください。



## 実装機能

    ユーザー新規登録,ログイン機能(devise,ウィザード形式)
    
    写真付き投稿機能
    
    イベント予約機能
    
    予約イベント一覧表示(ログインユーザー詳細画面)

    予約ユーザー一覧表示(ログインユーザーイベント詳細画面)
    
    予約取り消し機能
    
    予約締め切り機能
    
    イベント開催場所登録・表示機能(GoogleMapAPI,geocode,gon)

    インクリメンタルサーチ(jQuery)



## アプリケーションの利用
  #### URL:   https://abc.bookingdam.com
   ##### テストアカウントはログイン画面に移動した時にはすでに入力されています。お楽しみください。
 
 
  ### ローカルで実行する際のコマンド

    docker-compose build

    docker-compose up -d 

    docker-compose run app bundle exec rake db:create

    docker-compose run app bundle exec rake db:migrate

    docker-compose run app yarn add node-sass


## 使用技術


    言語： ruby(2.6.2),javascript

    フレームワーク： Ruby on Rails(5.2.1), Vue.js, jQuery

    DB： Mysql
    
    インフラ: AWS(EC2, S3, RDS, VPC, Route53, ELB)

    その他：

    Docker(開発環境、アプリケーションサーバーにpuma,webサーバーにnginxを用いて起動)

    webpacker

    RSpec
    
    rubocop
    


## 開発のきっかけ、解決する課題


      私が学生の頃所属していたビッグバンドジャズ部では、リサイタルなどのイベント予約をメールや電話で承る際、
      
    予約者の情報を紙で書いて、エクセルで打ち込んでいました。しかし、手間がかかる上、予約者数人数が多い
    
    場合にはかなりの時間を要するという問題がありました。そこで、学生バンドに限らず、文化的活動をしている
    
    人たちがもっと手軽にイベントを運営する手助けができるようなサービスを作りたいと思い、制作致しました。


## 工夫したポイント


    ・イベント開催日時とイベント予約締め切り日の登録の際に、VueのElement UIを用いて日付指定を分かりやすく容易にしました。
     UIで選択した日付をv-modelを用いて入力しています。


    ・イベント開催場所をGoogleMapAPI、geocodeを用いて場所名から座標を割り当て、登録できるようにしました。
     また、DBに保存した緯度と経度をgonを用いてイベント詳細画面上でGoogleMap表示できるようにしました。


    ・イベント開催者のみが、投稿したイベント毎で予約したユーザーをVue.jsを用いて閲覧できるようにしました。
     Vue.jsのaxiosを用いることでRails側で作成したapiを呼び出し、vue-routerを用いることでイベント詳細画面のidとapiのidを一致させました。

![demo](https://gyazo.com/9e493de1ffbba8b101128dbb1bfab6b8/raw)

![demo](https://gyazo.com/8c00ee45ead0d013e24d241dcee987d3/raw)

![demo](https://gyazo.com/ad1ec698eb6d034fc5ad7f598aca0e30/raw)

## DB設計

### usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false ,unique: true|
|email|string|null: false , unique: true|
|password|string|null: false , unique: true|
|image|string|
|text|text|

#### Association
- has_one :adress
- has_many :books
- has_many :reservations, dependent: :destroy
- has_many :reservation_books, through: :reservations, source: :book

### addressテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key :true|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|municipalities|string|:null: false|
|address|string|null: false|
|building|string| |
|phone_number|integer|null: false|
#### Association
- belongs_to :user, optional: true

### booksテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|title|string|null: false|
|image|string|
|text|text|
|published_at|datetime|null: false|
|end_day|date|:null: false|
|address|string|
|latitude|float|
|longitude|float|
#### Association
- belongs_to :user, optional: true
- has_many :reservations
- has_many :reservation_users, through: :reservations, source: :user

### reservationsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|book_id|integer|

#### Association
- belongs_to :book
- belongs_to :user
