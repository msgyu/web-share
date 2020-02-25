# なんでもあり
all = Category.create(name: 'なんでもあり・雑食')
vtuber = all.children.create(name: "Vtuber")
all_1 = all.children.create(name: "雑食")

# レビュー
review = Category.create(name: 'レビュー')
movie = review.children.create(name: "映画・アニメ・ドラマ・マンガ")
movie.children.create([{name: "映画"},{name: "アニメ"},{name: "ドラマ"},{name: "マンガ"}])


review.children.create([{name: "家電"}, {name: "本"}, {name: "食品"}, {name: "その他"}])
makeup = review.children.create(name: "メイク・美容・ファッション")
makeup.children.create([{name: "メンズ向け"}, {name: "レディース向け"}])


# プレイヤー・アーティスト・アウトドア
player = Category.create(name: "プレイヤー・アーティスト・アウトドア")
player.children.create([{name: "スポーツ"}, {name: "フィットネス"}, {name: "音楽・演奏・作曲"}, {name: "ダンス"}, {name: "DIY"}, {name: "ゲーム実況"}, {name: "釣り"}, {name: "旅行"}])
artitst = player.children.create(name: 'アート')
artitst.children.create([{name: "イラスト・漫画"}, {name: '絵画'}])

cuisine = player.children.create(name: "料理・大食い")
cuisine.children.create([{name: "大食い"}, {name: "料理・クッキング"}])


vehicle = player.children.create(name: "乗り物：バイク, 自転車, 自動車, etc")
vehicle.children.create([{name: "バイク"}, {name: "自転車"}, {name: "自動車"}, {name: "その他"}])

# ペット
pets = Category.create(name: "ペットと動物")
pets.children.create([{name: "犬"}, {name: "猫"}, {name: "その他"}])

# 政治・芸能・ニュース
news = Category.create(name: "政治・芸能・ニュース")

# HOW TO
how_to = Category.create(name: "HOW TO")
how_to.children.create([{name: "言語：英会話・中国語"}, {name: "IT・プログラミング"}, {name: "教育"}])

busines = how_to.children.create(name: "ビジネス・情報発信")
busines.children.create([{name: "物販"}, {name: "情報発信・メディア"}, {name: "投資"}, {name: "サービス"}])




