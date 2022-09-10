//
//  TrailerViewController.swift
//  Trailer Tv
//
//  Created by kenjimaeda on 08/09/22.
//

import UIKit

class TrailerViewController: UIViewController {
	
	@IBOutlet weak var labName: UILabel!
	@IBOutlet weak var imgMovie: UIImageView!
	@IBOutlet weak var labYear: UILabel!
	@IBOutlet weak var viTrailer: UIView!
	@IBOutlet weak var labRating: UILabel!
	
	var trailer: Trailer?
	
	override func viewDidLoad() {
		super.viewDidLoad()
 
	}
	
	
	@IBAction func handleDemiss(_ sender: UIButton) {
		dismiss(animated: true)
	}
	
	
	
}
