# Name
[アプリ名]　Bookingdam


[概要]  


・Bookingdamは、誰でも使うことができるイベント告知、イベント予約アプリです。
  このアプリは、イベント情報を分かりやすく伝えるだけでなく、予約者名簿を紙で手書きしたりエクセルで打ち込んだりする必要なく、自動で名簿を作成してくれます。
  予約する際も、イベント予約ボタンを一つ押すだけで手軽にできます。


・実装機能: 

    ユーザー新規登録,ログイン機能、写真投稿機能、イベント予約機能、予約イベント一覧表示(ユーザー詳細画面)

    予約ユーザー一覧表示(イベント詳細画面)、イベント開催場所登録・表示機能(GoogleMapAPI,geocode)

    インクリメンタルサーチ(jQuery)


・Rails + Vue.js(一部フロント) + Docker で開発しています。


・本番環境URL:   https://abc.bookingdam.com


・テストアカウント:  email: sogen0000@gmail.com  ,password: sogen0921

                
・ローカルで実行する際のコマンド

    docker-compose build

    docker-compose up -d 

    docker-compose run app bundle exec rake db:create

    docker-compose run app bundle exec rake db:migrate

    docker-compose run app yarn add node-sass


[使用技術]


    言語： ruby(2.6.2),javascript

    フレームワーク： Ruby on Rails(5.2.1), Vue.js, jQuery

    DB： Mysql


    その他：

    Docker(開発環境、アプリケーションサーバーにpuma,webサーバーにnginxを用いて起動)

    webpacker

    AWSによるデプロイ(EC2, S3, RDS, VPC, Route53, ELB)

    RSpec


[開発のきっかけ、解決する課題]


  私が学生の頃所属していたビッグバンドジャズ部では、リサイタルなどのイベント予約をメールや電話で承る際、
予約者の情報を紙で書いて、エクセルで打ち込んでいました。しかし、手間がかかる上、予約者数人数が多い
場合にはかなりの時間を要するという問題がありました。そこで、学生バンドに限らず、文化的活動をしている
人たちがもっと手軽にイベントを運営する手助けができるようなサービスがあると便利なのではないかと思い、作りました。


[工夫したポイント]


・イベント開催日時とイベント予約締め切り日の登録の際に、VueのElement UIを用いて日付指定を分かりやすく容易にしました。


・イベント開催場所をGoogleMapAPI、geocodeを用いて場所名から座標を割り当て、登録できるようにしました。また、DBに保存した緯度と経度をgonを用いてイベント詳細画面上で
GoogleMap表示できるようにしました。


・イベント開催者が、投稿したイベント毎で予約したユーザーをVue.jsを用いて閲覧できるようにしました。Vue.jsのaxiosを用いることでRails側で作成したapiを呼び出し、vue-
routerを用いることでイベント詳細画面のidとapiのidを一致させました。


[今後の課題]


・予約締切日以降は予約できないように機能実装する必要があること。


・目当てのイベント開催者をさらに容易に見つけるためにカテゴリー検索機能を実装するなど検索機能をさらに充実させること。
