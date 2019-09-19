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
# テストユーザ生成
User.create!( name: "武藤遊戯",
							name_kana: "むとうゆうぎ",
							telephone_number: 0120555555,
							email: "test@test",
						  postcode: 1500041,
						  address: "東京都渋谷区神南１－１－１－１",
						  password: "tttttt",
						  password_confirmation: "tttttt",
						  )
# テスト出店者生成
OnStoreUser.create!( owner_name: "海馬瀬人",
								owner_name_kana: "かいばせと",
								shop_name: "海馬コーポレーション",
								# image_id:,
								telephone_number: 0120555555,
							  email: "on@on",
							  postcode: 1500041,
							  address: "神奈川県横浜市緑区2-1-23",
							  business_hours: "朝8時から夕方5時まで",
								holiday: "土日祝日",
							  closest_station: "ドミノ町駅",
							  parking: "路駐OK",
							  greeting: "最強のデュエリストよ、かもん",
							  password: "oooooo",
							  password_confirmation: "oooooo",
							  is_public: true
							  # is_quit: is_quit
							  )

# 出店者を生成
51.times do |n|
	last_name = %w[山口 安倍 後藤 伊藤 斎藤 高橋 高田 高山 山田 藤本 藤井 藤崎 伊達 プルースト]
	first_name = %w[家康 義経 家光 光圀 忠家 義久 サルヴァドール 信長 小次郎 武蔵 豊久 元就 正宗 氏政]
	owner_name = "#{last_name[rand(0..13)]}#{first_name[rand(0..13)]}"
	last_name_kana = %w[やまぐち あべ ごとう いとう さいとう たかはし たかだ たかやま やまだ ふじもと ふじい ふじさき だて ぷるーすと]
	first_name_kana = %w[いえやす よすつね いえみつ みつくに ただいえ よしひさ さるゔぁどーる のぶなが こじろう むさし とよひさ もとなり まさむね うじまさ]
	owner_name_kana = "#{last_name_kana[rand(0..13)]}#{first_name_kana[rand(0..13)]}"
	shop1 = %w[山口 安倍 後藤 伊藤 斎藤 高橋 高田 高山 山田 藤本 藤井 藤崎 伊達 プルースト]
	shop2 = %w[工房 店 Shop ワークス (株) .co 修理店]
	shop_name = "#{shop1[rand(0..13)]}#{shop2[rand(0..6)]}"
	telephone_number = format('%011d',(rand(10..19))**7) # 適当な11桁
	email = "#{(0...20).map{ ('A'..'Z').to_a[rand(26)] }.join}@seeds.com"
	postcode = format('%07d',(rand(10..19))**5) # 適当な7桁
	address1 = %w[神奈川県横浜市 神奈川県川崎市 神奈川県相模原市 神奈川県厚木市 神奈川県海老名市 神奈川県藤沢市]
	address = "#{address1[rand(0..5)]}〇〇区〇〇町"
	parking = %w[有り 無し 店の前にスペース有り タイムズ提携]
	business_hours = %w[9:00~18:00 10時から19時 AM9時~PM5時 不定期]
	holiday = %w[土日 水曜金曜 年中無休 土日・祝日 月曜日 火曜金曜 金曜土曜 不定期]
	closest_station = %w[JR品川駅 JR目黒駅 東急自由が丘駅 京急鶴見駅 半蔵門駅 虎ノ門駅 六本木一丁目駅 渋谷駅]
	greeting = "サンプル　"
	greeting = "#{greeting * 20}"
	password = "password"
	# is_quit = [false, true]
	OnStoreUser.create!( owner_name: owner_name,
								owner_name_kana: owner_name_kana,
								shop_name: shop_name,
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
							  is_public: true
							  # is_quit: is_quit
							  )
end
# ユーザ生成
51.times do |n|
	last_name = %w[山口 安倍 後藤 伊藤 斎藤 高橋 高田 高山 山田 藤本 藤井 藤崎 伊達 島津 織田 北条 武田 上杉 南部 筒井 足利]
	first_name = %w[家康 義経 家光 光圀 忠家 義久 サルヴァドール 信長 小次郎 武蔵 豊久 元就 正宗 氏政]
	name = "#{last_name[rand(0..21)]}#{first_name[rand(0..13)]}"
	name_kana = "さんぷるたろう"
	telephone_number = format('%011d',(rand(10..19))**7) # 適当な11桁
	email = "#{(0...20).map{ ('A'..'Z').to_a[rand(26)] }.join}@seeds.com"
	postcode = format('%07d',(rand(10..19))**5) # 適当な7桁
	address1 = %w[神奈川県横浜市 神奈川県川崎市 神奈川県相模原市 神奈川県厚木市 神奈川県海老名市 神奈川県藤沢市]
	address = "#{address1[rand(0..5)]}〇〇区〇〇町"
	password = "password"
	# is_quit = [false, true]
	# テスト出店者生成
User.create!( name: name,
							name_kana: name_kana,
							telephone_number: telephone_number,
							email: email,
						  postcode: postcode,
						  address: address,
						  password: password,
						  password_confirmation: password,
						  )
end

# 注文前問合せを生成
User.all.length.times do |n|
	3.times do |i| # 各ユーザ毎に3つ持つ
		title = "title-#{n+1}"
		body = "body-#{(n+1)}"*100
		flag = %w[true false]
		Inquiry.create!( user_id: rand(1..User.all.length),
										on_store_user_id: rand(1..OnStoreUser.all.length),
										title: title,
										body: body,
										user_read: flag[rand(0..1)],
										on_store_user_read: flag[rand(0..1)]
								  )
	end
end

# テスト出店者呼び出し
shop_id = OnStoreUser.first.id

# 注文を生成
User.all.length.times do |n|
	user = User.find(n+1)
	maker = %w[CASIO CITIZEN OMEGA ROLEX 川村時計 源 サンプルクロックス 友村商事]
	model = %w[RX-78 ZGMF-X10A X-18999 M-72]
	symptom = "サンプル　"
	symptom = "#{symptom * 20}"
	2.times do |i| # 各ユーザ毎に2つ持つ
		Order.create!( user_id: user.id,
										on_store_user_id: shop_id,
										serial_number: OnStoreUser.find(shop_id).orders.count + 1,
										variety: rand(1..7),
										pickup: rand(1..4),
										maker: maker[rand(0..7)],
										model: model[rand(0..3)],
										symptom: symptom,
										repair_status: rand(1..8),
										repair_detail: symptom,
										payment: rand(1..3),
										charge: 50000,
										delivery: rand(1..4),
										delivery_day: DateTime.now
								  )
	end
end

# 注文後問合せを生成
Order.all.length.times do |n|
	order = Order.find(n+1)
	title = "title-#{n+1}"
	body = "body-#{(n+1)}"*100
	flag = %w[true false]
	Inquiry.create!( user_id: order.user_id,
									on_store_user_id: shop_id,
									order_id: order.id,
									title: title,
									body: body,
									user_read: flag[rand(0..1)],
									on_store_user_read: flag[rand(0..1)]
							  )
end

# レビューを生成
Order.all.length.times do |n|
	order = Order.find(n+1)
	title = "title-#{n+1}"
	body = "body-#{(n+1)}"*100
	Review.create!( user_id: order.user_id,
									on_store_user_id: shop_id,
									order_id: order.id,
									title: title,
									body: body
							  )
end

# サービス概要を生成
OnStoreUser.all.length.times do |n|
		on_store_user = OnStoreUser.find(n+1)
		name = %w[ゼンマイ式(一般国産) ゼンマイ式(舶来) 重錘式(ホールクロック) 全般]
		MajorCategory.create!(on_store_user_id: on_store_user.id,
													name: name[rand(0..3)]
								  			)
end
MajorCategory.all.length.times do |n|
	major_category = MajorCategory.find(n+1)
	2.times do |i| # 各ユーザ毎に3つ持つ
		name = %w[クォーツムーブ交換 目覚まし時計 掛、置時計 チャイム付き(メロディ) 国産(時打ちのみ)]
		MiddleCategory.create!(major_category_id: major_category.id,
														name: name[rand(0..4)]
									  			)
	end
end
MiddleCategory.all.length.times do |n|
	middle_category = MiddleCategory.find(n+1)
	3.times do |i| # 各ユーザ毎に3つ持つ
		name = %w[分解掃除 部品交換 ゼンマイ交換 部品新規作成 振り子付き 時報付き 通常時計のみ]
		quote = %w[7,000円 15,000円 プラス4,000 30,000円 50,000円 別途見積もり]
		MinorCategory.create!(middle_category_id: middle_category.id,
														name: name[rand(0..6)],
														quote: quote[rand(0..5)]
									  			)
	end
end