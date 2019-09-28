# Re:clock
時計修理店を検索し、修理依頼を受注できるWEBサイトです（デモ運営のみ）。
  
**実際のサイト**
　　
エンドユーザは[こちら](http://reclock.work/)
  
ストアユーザは[こちら](http://reclock.work/on_store_users/sign_up)
　　
## 制作目的
プログラミング学習目的で制作しました。
  
父の仕事の関係で"時計修理"をテーマにしています。
  
当業界は現在技術者の高齢化に伴い、ホールクロック（あの大きなノッポの古時計）などの大型の時計の修理依頼を断る店舗も増えてきているそうです。
  
ニーズはあるが技術的に応えられない、であれば応えられる技術者とお客様を繋ぐサービスを作ってみようと考え制作しました。
  
　　
## 制作にあたり意識したこと
* 利用シーン
  * 家族がリビングでスマホやタブレットを操作している姿を想定し、bootstrapを用いてレスポンシブ対応を行いました。
  * クレジットカードの入力を支払毎にするのは不便だと思い、Pay.jpで顧客情報の登録機能を実装しました。
* DRY
  * エンドユーザとストアユーザがやり取りするビューは重なる部分が多いので、sharedディレクトリを設けてパーシャルにしました。
* AJAXの利用
  *パーシャルで呼び出している部分については極力非同期通信で更新される様に制作しました。
  
## エンドユーザページ
  
### PC版HOME画面
  
<img src="https://github.com/TBTYOF/images/blob/master/reclock/home_pc.PNG" alt="HOME_PC" title="サンプル">
  
### スマホ版HOME画面
  
<img src="https://github.com/TBTYOF/images/blob/master/reclock/home_sp.jpg" alt="HOME_SP" title="サンプル">
  
### 各画面紹介
  * HOME
  * このサイトについて
  * 修理店一覧
  * 修理店詳細
  * サインイン/サインアップ
  * マイページ
  * 登録情報編集
  * 新規注文
  * 注文詳細
  * 注文編集
  * 出店希望者向け
  * 退会ページ
  
  
## 出店者ページ
  
### HOME画面
  
<img src="https://github.com/TBTYOF/images/blob/master/reclock/store_home.PNG" alt="STORE_HOME" title="サンプル">
  
### 各画面紹介
  * HOME
  * サインイン/サインアップ
  * 管理台帳（注文一覧）
  * 注文詳細
  * 注文編集
  * 問合せ一覧
  * 問合せ詳細
  * レビュー一覧
  * マイページ
  * 登録情報編集
  * 退会ページ
  
  
## 管理者ページ
  
### HOME画面
  
<img src="https://github.com/TBTYOF/images/blob/master/reclock/admin_home.PNG" title="サンプル">
  
### 各画面紹介
  * HOME
  * サインイン/サインアップ
  * 出店者一覧
  * 出店者詳細
  * エンドユーザ一覧
  * エンドユーザ詳細
  * 注文一覧
  * 注文詳細
  * 問合せ一覧
  * 問合せ詳細
  * レビュー一覧
  
  
## ダウンロード
[こちら](https://github.com/TBTYOF/Reclock)のページから任意のディレクトリへ"git clone"して下さい。
　　
  
## 開発者の皆様へ
ローカル環境で動作確認をする際は"develop branch"を使用して下さい。
  
"master branch" は本番環境用の設定をしているため、"rails db:migrate"が実行できません。
  
## 開発環境
* 使用言語
  * Ruby version 2.5.5
* フレームワーク
  * Ruby on Rails version 5.2.3
* 仮想環境
  * Vagrant
* データベース
  * sqlite3

## 主に使用しているライブラリ
* jquery-rails
* bootstrap-sass versiton 3.3.6
* pry-byebug
* devise
* devise-i18n
* devise-i18n-views
* refile
* refile-mini_magick
* kaminari versiton 1.1.1
* cocoon
* payjp
* ransack
* rails-i18n
* dotenv-rails
* letter_opener_web
  
## 最後に
学習環境は"Infratop"の"DMM WEBCAMP"です。
  
メンターの方々にご指導頂き、一旦の完成までたどり着きました。
  
ありがとうございました！
