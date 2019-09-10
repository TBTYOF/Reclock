# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 管理者を生成
Admin.create!( name: "Administrater",
							 email: "admin@reclock.com",
							 password: 'password',
							 password_confirmation: 'password'
							 )

# 出店者を生成
30.times do |n|
	last_name = %w[山口 安倍 後藤 伊藤 斎藤 高橋 高田 高山 山田 藤本 藤井 藤崎 伊達 プルースト]
	first_name = %w[家康 義経 家光 光圀 忠家 義久 サルヴァドール 信長 小次郎 武蔵 豊久 元就 正宗 氏政]
	owner_name = "#{last_name[rand(1..14)]}#{first_name[rand(1..14)]}"
	last_name_kana = %w[やまぐち あべ ごとう いとう さいとう たかはし たかだ たかやま やまだ ふじもと ふじい ふじさき だて ぷるーすと]
	first_name_kana = %w[いえやす よすつね いえみつ みつくに ただいえ よしひさ さるゔぁどーる のぶなが こじろう むさし とよひさ もとなり まさむね うじまさ]
	owner_name_kana = "#{last_name_kana[rand(1..14)]}#{first_name_kana[rand(1..14)]}"
	telephone_number = format('%011d',(rand(10..19))**7) # 適当な11桁
	email = "#{(0...8).map{ ('A'..'Z').to_a[rand(26)] }.join}@seeds.com"
	postcode = format('%07d',(rand(10..19))**5) # 適当な7桁
	address1 = %w[神奈川県横浜市 神奈川県川崎市 神奈川県相模原市 神奈川県厚木市 神奈川県海老名市 神奈川県藤沢市]
	address = "#{address1[rand(1..6)]}〇〇区〇〇町"
	parking = %w[有り 無し 店の前にスペース有り タイムズ提携]
	business_hours = %w[9:00~18:00 10時から19時 AM9時~PM5時 不定期]
	holiday = %w[土日 水曜金曜 年中無休 土日・祝日 月曜日 火曜金曜 金曜土曜 不定期]
	closest_station = %w[JR品川駅 JR目黒駅 東急自由が丘駅 京急鶴見駅 半蔵門駅 虎ノ門駅 六本木一丁目駅 渋谷駅]
	greeting = "サンプル　"
	greeting = "#{greeting * 20}"
	password = "password"
	is_public = true
	# is_quit = [false, true]
	OnStoreUser.create!( owner_name: owner_name,
								owner_name_kana: owner_name_kana,
								# image_id:,
								telephone_number: telephone_number,
							  email: email,
							  postcode: postcode,
							  address: address,
							  business_hours: business_hours.sample,
								holiday: holiday.sample,
							  closest_station: closest_station.sample,
							  parking: parking.sample,
							  greeting: greeting,
							  password: password,
							  password_confirmation: password,
							  is_public: is_public
							  # is_quit: is_quit
							  )
end