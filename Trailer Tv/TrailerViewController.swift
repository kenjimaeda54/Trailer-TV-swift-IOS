//
//  TrailerViewController.swift
//  Trailer Tv
//
//  Created by kenjimaeda on 08/09/22.
//

import UIKit
import AVKit

class TrailerViewController: UIViewController {
	
	@IBOutlet weak var labName: UILabel!
	@IBOutlet weak var imgMovie: UIImageView!
	@IBOutlet weak var labYear: UILabel!
	@IBOutlet weak var viTrailer: UIView!
	@IBOutlet weak var labRating: UILabel!
	
	var trailer: Trailer?
	var player: AVPlayer?
	var playerViewController: AVPlayerViewController?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		prepareView()
		watchMovie()
	}
	
	func prepareView() {
		labName.text = trailer?.title
		imgMovie.image = UIImage(named: "\( trailer!.poster)-large")
		
		if trailer!.rating > 0 {
			var ratting = ""
			for _ in 1...trailer!.rating {
				ratting += "⭐️"
				print("opa")
			}
			labRating.text = ratting
		}else {
			labRating.text =  "Don't existe evaluation"
		}
		
		labYear.text = "\( trailer!.year)"
	}
	
	func watchMovie() {
		if let url = URL(string: trailer!.url){
			player = AVPlayer(url: url)
			playerViewController = AVPlayerViewController()
			playerViewController?.player = player
			playerViewController?.showsPlaybackControls = true
			playerViewController?.player?.play()
			//bounds e area interna e bom quando deseja coloca um frame dentro
			//de outro que este casso e  frame do propria view do playerViewController
			playerViewController?.view.frame = viTrailer.bounds
			viTrailer.addSubview(playerViewController!.view)
		}
		
	}
	
	@IBAction func handleDemiss(_ sender: UIButton) {
		dismiss(animated: true)
	}
	
	
	
}
