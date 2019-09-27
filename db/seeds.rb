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
User.create!( name: "山田太郎",
							name_kana: "やまだたろう",
							telephone_number: "0801231234",
							email: "user@test.com",
						  postcode: 1500041,
						  address: "東京都渋谷区神南１丁目１９−１０ パークウェースクエア2 4F",
						  password: "testuser",
						  password_confirmation: "testuser",
						  )
# テスト出店者生成
OnStoreUser.create!( owner_name: "山田　花子",
								owner_name_kana: "やまだ　はなこ",
								shop_name: "山田花子時計店",
								# image_id:,
								telephone_number: "0451231234",
							  email: "store@test.com",
							  postcode: 2350023,
							  address: "神奈川県横浜市磯子区１丁目１番１号",
							  business_hours: "朝8時から夕方5時まで",
								holiday: "土日祝日",
							  closest_station: "磯子駅",
							  parking: "路駐OK",
							  greeting: "サンプル",
							  password: "storeuser",
							  password_confirmation: "storeuser",
							  is_public: true
							  # is_quit: is_quit
							  )

# 出店者を生成
51.times do |n|
	last_name = %w[山口 安倍 後藤 伊藤 斎藤 高橋 高田 高山 山田 藤本 藤井 藤崎 伊達 プルースト]
	first_name = %w[家康 義経 家光 光圀 忠家 義久 サルヴァドール 信長 小次郎 武蔵 豊久 元就 正宗 氏政]
	owner_name = "#{last_name[rand(0..13)]}　#{first_name[rand(0..13)]}"
	owner_name_kana = "さんぷるてんぽ"
	shop1 = %w[山口 安倍 後藤 伊藤 斎藤 高橋 高田 高山 山田 藤本 藤井 藤崎 伊達 プルースト]
	shop2 = %w[工房 店 Shop ワークス (株) 商会 修理店]
	shop_name = "#{shop1[rand(0..13)]}#{shop2[rand(0..6)]}"
	number1 = [40, 41, 42, 43, 44, 45, 46, 47, 48]
	num     = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
	telephone_number = format('%011d',"#{number1[rand(0..8)]}#{(0...8).map{ num[rand(10)]}.join}")
	email = "#{(0...20).map{ ('A'..'Z').to_a[rand(26)] }.join}@seeds.com"
	postcode = format('%07d',(rand(10..19))**5) # 適当な7桁
	address1 = %w[神奈川県横浜市 神奈川県川崎市 神奈川県相模原市 神奈川県厚木市 神奈川県海老名市 神奈川県藤沢市]
	address = "#{address1[rand(0..5)]}〇〇区〇〇町"
	parking = %w[有り 無し 店の前にスペース有り タイムズ提携]
	business_hours = %w[9:00~18:00 10時から19時 AM9時~PM5時 不定期]
	holiday = %w[土日 水曜金曜 年中無休 土日・祝日 月曜日 火曜金曜 金曜土曜 不定期]
	greeting = ["古時計の修理屋さん～\n思い出の時計、大切な時計を直します。",
							"時計修理の匠工房では、お見積り無料はもちろん、商品にかかる送料も無料ですので、お気軽にお見積り頂けます。",
							"～時計修理〇〇について～\n１級時計修理技能士、２級時計修理技能士が丁寧に作業いたします。小さなブランド時計の修理店ですのでお待たせしてしまうこともありますがブランド時計の修理の技術力をしっかりそそぎ１つ１つより良い状態でお戻しいたします。\nロレックスをはじめとしたスイス時計のオーバーホールからアンティーク時計の修理など是非当店にご相談下さい。オーバーホール特典などについてもご案内いたします。",
							"国産ブランドから、インポートブランドの腕時計まで、専門スタッフが承ります。\nご相談からお気軽にご来店くださいませ。",
							"時計を大切にされていらっしゃる方も多いですが、中には昔からアンティーク時計を大切にしているとお話くださる方もいらっしゃいます。\nしかし何かの拍子に傷がついてしまったり、部品が一部とれてしまったりとトラブルが起こることもあります。\nせっかくこれまで大事にしてきたのに、どうしたらいいのかとお困りになった際は一度当店までご相談ください。\n\nまずは状況を確認させていただき、どう原状回復をするのか考えます。状態によってはリペアが可能なケースもありますので、状況にあわせご案内をいたします。\n部品交換となると、昔のものだから部品が調達出来るか分からないとの事例もございます。当店では熟練された技術と豊富な部品で時計リペアをしますので、是非ご活用ください",
							"供給がない部品の製作技術\n\n入手困難、入手不可能な部品の新規製作が可能です。\n他店で部品交換が出来なかった時計、アンティーク時計も、キャリアを重ねた技術者が対応します。\n供給がない部品は、0から製作ができるから幅広い状態・年式の時計を修理することができます。"]
	password = "password"
	# is_quit = [false, true]
	OnStoreUser.create!( owner_name: owner_name,
								owner_name_kana: owner_name_kana,
								shop_name: shop_name,
								telephone_number: telephone_number,
							  email: email,
							  postcode: postcode,
							  address: address,
							  business_hours: business_hours.sample,
								holiday: holiday.sample,
							  closest_station: "◯◯駅",
							  parking: parking.sample,
							  greeting: greeting[rand(0..5)],
							  password: password,
							  password_confirmation: password,
							  is_public: true
							  # is_quit: is_quit
							  )
end
# ユーザ生成
51.times do |n|
	last_name = %w[山口 安倍 後藤 伊藤 斎藤 高橋 高田 高山 山田 藤本 藤井 藤崎 伊達 島津 織田 北条 武田 上杉 南部 筒井 足利]
	first_name = %w[家康 義経 家光 光圀 忠家 義久 又兵衛 信長 小次郎 武蔵 豊久 元就 正宗 氏政]
	name = "#{last_name[rand(0..20)]}#{first_name[rand(0..13)]}"
	name_kana = "さんぷるゆーざ"
	number1 = [80, 90, 50, 70]
	num     = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
	telephone_number = format('%011d',"#{number1[rand(0..3)]}#{(0...8).map{ num[rand(10)]}.join}")
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
100.times do |n|
	title = %w[集荷について 直りますか？ 取扱ってる時計の種類について 修理料金について 集荷できるか質問です]
	body = ["はじめまして、今うちにある時計の修理を考えているのですが、\n大きいものになりますので家まで取りに来て頂け得ると助かるのですが可能でしょうか？",
					"時計の修理についてお尋ねさせて頂きます。\n\n30年程前にスイスへ旅行に行った際に買った時計で〇〇というメーカーのものなのですが、\nこういった海外の時計でも直せますでしょうか？",
					"こんにちは、サービス概要の項目を見て質問してます。\n\n項目には〇〇と記載がありましたが、〇〇の壁にかけるタイプも取り扱っていますか？",
					"時計修理の料金についてお尋ねします。\n〇〇が別途見積とあるのですが大体相場だといくら位になりますでしょうか？",
					"はじめまして、こちらのサイトで修理店を探して居たのですが、近くの店舗では取扱の無い種類のものだったのでお問合せさせて頂いてます。\n\n〇〇県〇〇市なのですが集荷は可能でしょうか？"]
	is_title = rand(0..4)
	flag = %w[true false]
	Inquiry.create!( user_id: rand(1..User.all.length),
									on_store_user_id: rand(1..OnStoreUser.all.length),
									title: title[is_title],
									body: body[is_title],
									user_read: flag[rand(0..1)],
									on_store_user_read: flag[rand(0..1)]
							  )
end

# 注文を生成
150.times do |n|
	on_store_user_id = rand(1..OnStoreUser.all.length)
	maker = %w[CASIO CITIZEN OMEGA ROLEX SEIKO ロジェ・デュブイ サンプルクロックス]
	model = %w[RX-78 ZGMF-X10A X-18999 SUPER-SS-3001BPR HIGH-GRADEPW1234YBPA 11-2114F]
	charge = [7_000, 15_000, 4_000, 30_000, 50_000, 85_000, 100_000]
	symptom = %w[落とした衝撃で6時側のクロノグラフの針が取れた
							 オーバーホールを勧められたため
							 電池交換しても動かない
							 ゼンマイを巻き上げてもすぐに止まる
							 遅れが出てきた
							 ガラスが曇る]
	repair_status = rand(1..8)
	if repair_status == 6 || repair_status == 7
		Order.create!( user_id: rand(1..User.all.length),
										on_store_user_id: on_store_user_id,
										serial_number: OnStoreUser.find(on_store_user_id).orders.count + 1,
										variety: rand(1..6),
										pickup: rand(1..3),
										maker: maker[rand(0..7)],
										model: model[rand(0..5)],
										symptom: symptom[rand(0..5)],
										repair_status: rand(1..8),
										repair_detail: "〇〇のため、XXしました。\n\n〇〇に対して、XX完了",
										payment: rand(1..3),
										charge: charge[rand(0..5)],
										delivery: rand(1..4),
										delivery_day: DateTime.now
								  )
	else
		Order.create!( user_id: rand(1..User.all.length),
									on_store_user_id: on_store_user_id,
									serial_number: OnStoreUser.find(on_store_user_id).orders.count + 1,
									variety: rand(1..6),
									pickup: rand(1..3),
									maker: maker[rand(0..7)],
									model: model[rand(0..5)],
									symptom: symptom[rand(0..5)],
									repair_status: rand(1..8),
									repair_detail: symptom,
									payment: rand(1..3),
									charge: charge[rand(0..5)],
									delivery: rand(1..4)
							  )
	end
end

# 注文後問合せを生成
200.times do |n|
	order = Order.find(rand(1..Order.all.length))
	title = %w[修理期間について 見積について 修理状況について 納品方法について キャンセルについて]
	body =  ["お世話になります、修理期間はどのくらいになりますでしょうか？",
					 "こんにちは、先日更新された見積金額についてお尋ねします。\nサービス概要にあった料金と違っているようですが何が原因でしょうか？",
					 "集荷から◯週間立ちますが今どのような状況でしょうか？",
					 "修理ありがとうございます。\n納品日は自宅まで届けていただけると助かります。\n今週ですと◯曜、◯曜でしたら自宅に居ます。",
					 "今回依頼させて頂きましたが、自己都合によりキャンセルさせて下さい。\n時計は取りにお伺いします。\n\n申し訳有りません。"]
	is_title = rand(0..4)
	flag = %w[true false]
	Inquiry.create!( user_id: order.user_id,
									on_store_user_id: order.on_store_user_id,
									order_id: order.id,
									title: title[is_title],
									body: body[is_title],
									user_read: flag[rand(0..1)],
									on_store_user_read: flag[rand(0..1)]
							  )
end

# レビューを生成
Order.all.length.times do |n|
	order = Order.find(n+1)
	title = %w[本日、時計修理品確かに受取りました。
						 仕上がりもとても綺麗なことに感激しています!
						 満足しています。
						 修理ありがとうございました。
						 丁寧な対応ありがとうございます。
						 昨日、無事時計届きました。]
	body =  ["どうも有難う御座いました。\n\nまた着用でき嬉しくおもいます。",
					 "会社を設立したときに、目標達成のご褒美として購入したのが20年前。\n\n忙しさにかまけてついつい、オーバーホールをおこたってしまいました。\n今後は定期的なメンテナンスをするようにします。\nその際は、またお願いします。\nお世話になりました。",
					 "納品時にもお話ししましたが、丁寧な仕上げで、キズが本当に目立たなくなり新品に甦ったような気がしています。\nまた、修理をお願いする前は、少し時間が進む傾向がありましたが、帰ってきて1日ですが、正確に時を刻んでくれています。\n今後は、定期的にオーバーホールをお願いして、大事に大事に付き合っていきたいと思っています。\n\n毎年、数回海外に出かけますが、家に帰ってきた時この時計を見るのが楽しみになります。 今後は、定期的にオーバーホールをお願いして、大事に大事に付き合っていきたいと思っています。適切な時期が来ましたら、オーバーホールのご案内など、いただければ幸いです",
					 "本日、時計の納品がありました。あまりの仕上がりに、驚愕、匠の技に敬服です！頼んで良かったです。ありがとうございました。",
					 "私の住まいが田舎の為、近所に任せられる修理店がなく、初めはネットで修理をお願いすることに不安でしたが、\n申し込み前のお問合せ、見積り内容もサイトできちんと連絡を頂けましたので、安心してお任せすることができました。\n\nただ、もう少し修理が早く完了すれば良いな～と思いました。（私の勝手な言い分ですが）\n仕上がりについては満足です。どうもありがとうございました。",
					 "ネット修理は初めてで不安でしたが、写真で受取り連絡をくださり、そこから信頼にかわり安心して修理をお願いすることができました。\n外観も綺麗になり、新品のように本日から稼働しています。 本当にありがとうございました。また、機会がありましたら是非宜しくお願いします。"]
	is_title = rand(0..5)
	Review.create!( user_id: order.user_id,
									on_store_user_id: order.on_store_user_id,
									order_id: order.id,
									title: title[is_title],
									body: body[is_title]
							  )
end

# サービス概要を生成
OnStoreUser.all.length.times do |n|
	on_store_user = OnStoreUser.find(n+1)
	2.times do |i|
		name = %w[ゼンマイ式(一般国産) ゼンマイ式(舶来) 重錘式(ホールクロック) 全般]
		MajorCategory.create!(on_store_user_id: on_store_user.id,
													name: name[rand(0..3)]
								  			)
	end
end
MajorCategory.all.length.times do |n|
	major_category = MajorCategory.find(n+1)
	2.times do |i|
		name = %w[クォーツムーブ交換 目覚まし時計 掛、置時計 チャイム付き(メロディ) 国産(時打ちのみ)]
		MiddleCategory.create!(major_category_id: major_category.id,
														name: name[rand(0..4)]
									  			)
	end
end
MiddleCategory.all.length.times do |n|
	middle_category = MiddleCategory.find(n+1)
	3.times do |i|
		name = %w[分解掃除 部品交換 ゼンマイ交換 部品新規作成 振り子付き 時報付き 通常時計のみ]
		quote = %w[7,000円 15,000円 プラス4,000 30,000円 50,000円 別途見積もり]
		MinorCategory.create!(middle_category_id: middle_category.id,
														name: name[rand(0..6)],
														quote: quote[rand(0..5)]
									  			)
	end
end