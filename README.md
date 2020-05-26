# Name
[アプリ名]　Bookingdam

[使用技術]
・言語： ruby(2.6.2),javascript
・フレームワーク： Ruby on Rails(5.2.1), Vue.js, jQuery
・DB： Mysql
・環境： Docker(開発環境、アプリケーションサーバーにpuma,webサーバーにnginxを用いて起動)
        webpacker
        AWSによるデプロイ(EC2, S3, RDS, Route53, ELB)
        RSpec

[概要]  
・Bookingdamは、誰でも使うことができるイベント予約アプリです。

・実装機能: 
    ユーザー新規登録,ログイン機能、投稿機能,写真投稿機能、イベント予約機能、予約イベント表示(ユーザー詳細画面)
    予約ユーザー表示(イベント詳細画面)、イベント開催場所登録・表示機能(GoogleMapAPI,geocode)
    インクリメンタルサーチ、ユーザー・イベント一覧表示

・Rails+Vue.js+Dockerで開発しています。
・本番環境URL:  https://abc.bookingdam.com
    テストアカウント email: sogen0000@gmail.com  ,password: sogen0921
                
・ローカルで実行する際のコマンド
　　 docker-compose build
    docker-compose up -d 
    docker-compose run app bundle exec rake db:create
    docker-compose run app bundle exec rake db:migrate
    docker-compose run app yarn add node-sass
    
[開発のきっかけ]
  学生の頃所属していたビッグバンドジャズ部ではイベント予約を承る際、メールや電話でエクセルで打ち込んでいましたが、人数が多く
  

