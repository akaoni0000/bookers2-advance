## 概要
私がrailsで初めて作ったアプリケーションです。本の感想を言い合えるSNSアプリです。<br>

## バージョン
ruby・・・2.5.7<br>
rails・・・5.2.4.4<br>
nginx・・・1.19.3<br>
mysql・・・5.7

## ローカル環境での実行手順
dockerとdocker-composeを自分のpcにインストール

好きなディレクトリで<br>
`git clone https://github.com/Mac0917/bookers2-advance.git`

移動<br>
`cd bookers2-advance`

docker-composeを実行<br>
`docker-compose up -d`

データベース作成<br>
`docker exec -it bookers2-advance_app_1 bash`<br>
`rails db:create`<br>
`rails db:migrate`

アクセス<br>
http://localhost/

終了<br>
`exit`(コンテナから出る)<br>
`docker-compose stop`<br>
`docker-compose rm`<br>
`docker rmi bookers2-advance_app bookers2-advance_web`<br>
`docker volume rm bookers2-advance_db-data bookers2-advance_public-data bookers2-advance_tmp-data`



