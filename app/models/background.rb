class Background < ActiveRecord::Base
	attr_reader :url
	def initialize(summary)

		pic_hash = {
			"snow" => ["https://download.unsplash.com/photo-1427955569621-3e494de2b1d2",
			"https://download.unsplash.com/reserve/unsplash_52cee67a5c618_1.JPG",
			"https://download.unsplash.com/photo-1430132594682-16e1185b17c5",
			"https://download.unsplash.com/photo-1425136738262-212551713a58",
			"https://download.unsplash.com/reserve/Ept9mCvnTiahpYXPi9Ej_DSC_0010.jpg",
			"https://download.unsplash.com/photo-1414541944151-2f3ec1cfd87d"],
			"rain" => ["https://download.unsplash.com/photo-1429095687696-3227bb0aa9a8",
			"https://download.unsplash.com/reserve/8S64npOgTu2eWTZIXEfy_DSC_0955.JPG",
			"https://download.unsplash.com/photo-1422544834386-d121ef7c6ea8"],
			"fog" => ["https://download.unsplash.com/photo-1428836962997-9533e673a68f",
			"https://download.unsplash.com/photo-1428342319217-5fdaf6d7898e",
			"https://download.unsplash.com/reserve/IPEivX6xSBaiYOukY88V_DSC06462_tonemapped.jpg",
			"https://download.unsplash.com/reserve/MTuhqSiPQbeVnaIYU16X_P1160798_adj.jpg",
			"https://download.unsplash.com/photo-1418065460487-3e41a6c84dc5",
			"https://download.unsplash.com/uploads/14115409319165441c030/a1d0230a"],
			"sunny" => ["https://download.unsplash.com/uploads/14126758789351371c7ec/aa322c2d",
			"https://download.unsplash.com/photo-1428908799722-0a74e26ce7f6",
			"https://download.unsplash.com/photo-1428604467652-115d9d71a7f1",
			"https://download.unsplash.com/reserve/QTrNn7DETWGsjyS5L2n5__MG_8345.jpg",
			"https://download.unsplash.com/reserve/RONyPwknRQOO3ag4xf3R_Kinsey.jpg"],
			"cloudy" => ["https://download.unsplash.com/photo-1427348693976-99e4aca06bb9"],
			"dry" => ["https://download.unsplash.com/photo-1413977886085-3bbbf9a7cf6e"]
		}
		pic_hash.keys.each do |key|
			if summary.include?(key)
				@url =  pic_hash[key].sample		
			end
		end
		@url = "https://download.unsplash.com/photo-1413977886085-3bbbf9a7cf6e" if @url == nil
	end
end
