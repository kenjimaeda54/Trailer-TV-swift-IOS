//
//  ViewController.swift
//  Trailer Tv
//
//  Created by kenjimaeda on 08/09/22.
//

import UIKit

class MovieViewController: UIViewController {
	
	
	@IBOutlet weak var tabViewMovie: UITableView!
	
	var trailerManager = TrailerManager()
	var trailer: Trailer?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		tabViewMovie.delegate = self
		tabViewMovie.dataSource = self
		trailerManager.loadTrailer()
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "trailerSegue" {
			let vc = segue.destination as! TrailerViewController
			//sender sera ja a propriedade
			vc.trailer = sender as? Trailer
		}
	}
	
	@IBAction func watchRandom(_ sender: UIButton) {
	  movieSelected(trailerManager.trailers?.randomElement())
	}
	
	func movieSelected(_ trailer: Trailer?) {
		performSegue(withIdentifier: "trailerSegue", sender: trailer)
	}
	
}

//MARK: - UITableViewDelegate,UITableViewDataSource
extension MovieViewController: UITableViewDelegate,UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return trailerManager.trailers?.count ?? 0
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		let trailer = trailerManager.trailers?[indexPath.row]
		cell.textLabel?.text = trailer?.title
		cell.detailTextLabel?.text = "\(String(describing: trailer!.year))"
		cell.imageView?.image = UIImage(named: trailer?.poster ?? "logo")
		let backgroundView = UIView()
		backgroundView.backgroundColor = UIColor.yellow
		cell.selectedBackgroundView = backgroundView
		return cell
	}
	 
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
	  movieSelected(trailerManager.trailers?[indexPath.row])
	}
}

