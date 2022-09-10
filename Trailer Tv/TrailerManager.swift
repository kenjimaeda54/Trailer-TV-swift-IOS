//
//  TraileManager.swift
//  Trailer Tv
//
//  Created by kenjimaeda on 08/09/22.
//

import Foundation

struct TrailerManager {
	
	var trailers: [Trailer]?
	


	mutating	func loadTrailer() {
		if let url = Bundle.main.url(forResource: "trailers", withExtension: "json") {
			
			do {
				let data = try Data(contentsOf: url)
				trailers = try JSONDecoder().decode([Trailer].self, from: data)
				
			}catch{
				print(error.localizedDescription)
			}
		}
	}
}
