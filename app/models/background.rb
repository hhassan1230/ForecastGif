class Background < ActiveRecord::Base
	attr_reader :url, :summary, :gif
	def initialize(summary)
		@summary = summary
		final_array = []
		pic_hash = {
		"snow" => ["photo-1427955569621-3e494de2b1d2",
			"reserve/unsplash_52cee67a5c618_1.JPG",
			"photo-1430132594682-16e1185b17c5",
			"photo-1425136738262-212551713a58",
			"photo-1428908200541-d395094cc816",
			"photo-1430982295958-c653a7faa0e2",
			"photo-1432057322224-8916b9ed202a",
			"reserve/Ept9mCvnTiahpYXPi9Ej_DSC_0010.jpg",
			"photo-1414541944151-2f3ec1cfd87d"],
		"rain" => ["photo-1429095687696-3227bb0aa9a8",
			"reserve/8S64npOgTu2eWTZIXEfy_DSC_0955.JPG",
			"photo-1431949681254-23b9a28a5fe8",
			"photo-1428592953211-077101b2021b",
			"photo-1431095384967-d4e60354512d",
			"photo-1431037242647-4c2c27cb5bb1",
			"photo-1430932670556-d0002ea51b33",
			"photo-1422544834386-d121ef7c6ea8"],
		"fog" => ["photo-1428836962997-9533e673a68f",
			"photo-1432639557412-3959ab5e8047",
			"photo-1432250681869-3784e3d5a99f",
			"photo-1431898542497-133ad897e05f",
			"photo-1432634195758-8bc0b6945201",
			"photo-1428342319217-5fdaf6d7898e",
			"reserve/IPEivX6xSBaiYOukY88V_DSC06462_tonemapped.jpg",
			"reserve/MTuhqSiPQbeVnaIYU16X_P1160798_adj.jpg",
			"photo-1418065460487-3e41a6c84dc5",
			"uploads/14115409319165441c030/a1d0230a"],
		"sunny" => ["uploads/14126758789351371c7ec/aa322c2d",
			"photo-1428908799722-0a74e26ce7f6",
			"photo-1428604467652-115d9d71a7f1",
			"reserve/QTrNn7DETWGsjyS5L2n5__MG_8345.jpg",
			"reserve/RONyPwknRQOO3ag4xf3R_Kinsey.jpg"],
		"cloudy" => ["photo-1427348693976-99e4aca06bb9", 
				"photo-1428908728789-d2de25dbd4e2",
				"photo-1432149697948-900013ba3087",
				"photo-1428908684367-2fe456a630bb"],
		"clear-day" => ["photo-1427434846691-47fc561d1179", 
			"photo-1413977886085-3bbbf9a7cf6e", 
			"photo-1432712641917-22ce322ab531",
			"photo-1432666904444-af2253fb34e7",
			"photo-1432653435792-b2c4ae7688d6",
			"photo-1432634372475-07b399e372ee",
			"photo-1431910246269-dc9202bc8a88",
			"photo-1432057000846-e2204c1b22e4",
			"photo-1431795732806-67f0b821d962",
			"photo-1432531029431-21ab7e8009e5",
			"photo-1432149586282-dcde63427978",
			"photo-1432105214010-ae5e45b2cebb",
			"photo-1432105117111-b8c5bed69654",
			"photo-1432405972618-c60b0225b8f9"],
		"clear-night" => ["photo-1430132594682-16e1185b17c5",
				"photo-1429305336325-b84ace7eba3b",
				"photo-1432539367333-d5f20421f666",
				"photo-1431817986760-7cc7fbb937b2",
				"photo-1431664207401-c7b002aad93c",
				"photo-1432164218008-c059df739fd4",
				"photo-1432183163557-d2779f981bd3",
				"photo-1432103616569-e38e6553310c"],
		"partly-cloudy-night" => ["photo-1432322101134-d365f0b2bc62", 
					"photo-1432322101134-d365f0b2bc62",
					"photo-1431986229655-9ca60378f77d",
					"photo-1431222176733-053f6ddcab8e",
					"photo-1432265910742-819d660410b4"],
		"partly-cloudy-day" => ["photo-1432713643391-77a1b3f57e84",
			"photo-1432674134753-a15e24aa45c8",
			"photo-1432672301844-a3619c197980",
			"photo-1432662960358-6c452bee76f2",
			"photo-1431794062232-2a99a5431c6c",
			"photo-1432645783997-4890d6ef05c7",
			"photo-1432071375803-08a3f5fd224f",
			"photo-1432071315934-33a387ee0437",
			"photo-1432059964050-d4eba2ef368a"],
		"hail" => ["photo-1431887915357-68b819fae322",
			"photo-1423853978401-35df4077ff7d",
			"photo-1428908200541-d395094cc816",
			"photo-1428550469419-649110c0bc12",
			"photo-1429117274768-73478e02cc81",
			"photo-1430982295958-c653a7faa0e2"],
		"thunderstorm" => ["photo-1431440869543-efaf3388c585",
			"photo-1427507791254-e8d2fe7db7c0",
			"photo-1429552054921-018e433d7d34",
			"photo-1429552077091-836152271555"],
		"wind" => ["photo-1432618131319-b57bfcaea7a7",
			"photo-1429630319381-d99398e1cb4b"],
		"sleet" => ["photo-1431887915357-68b819fae322",
			"photo-1431324226071-fb6a478cb4c8",
			"photo-1423853978401-35df4077ff7d",
			"photo-1431036101494-66a36de47def",
			"photo-1428908200541-d395094cc816",
			"photo-1429117274768-73478e02cc81",
			"photo-1430932670556-d0002ea51b33"],
		"tornado" => ["photo-1430116267665-e7f6b3dafce3"]
		}
		final_array << pic_hash[summary].sample
		@url = "https://download.unsplash.com/#{final_array[0]}"
		@gif = get_gify(@summary)
	end
	def get_gify(summary)
		weather_search = summary.gsub("partly-", "").gsub("-", "+").downcase
		gif_url = "http://api.giphy.com/v1/gifs/search?q=#{weather_search}&api_key=#{ENV["GIFKEY"]}"
		gif_hash = JSON.parse(File.read(open(gif_url)))
		gif_hash["data"].sample["images"]["original"]["url"]
	end
end
