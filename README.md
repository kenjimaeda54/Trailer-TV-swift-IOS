# Trailer Tv
Aplicativo com trailers de filmes

## Motivação
Praticar uso do AVPlayer e suas particularidades

## Feature
- Abaixo tem alogaritimo para enviar dados para outra tela e navegar nela
- Com uso do método performSegue  navego entre as telas 
- Prepare, preparo essa navegação, argumento sender e argumento que desejamos enviar,neste caso struct Trailer
- Se desejo apenas navegar não preciso do método prepare pode ser apenas performSegue

```swift


performSegue(withIdentifier: "trailerSegue", sender: trailer)

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 if segue.identifier == "trailerSegue" {
	let vc = segue.destination as! TrailerViewController
			//sender sera ja a propriedade
	vc.trailer = sender as? Trailer
		}
}
  
```

## 
- Aprendi alterar a cor da célula selecionada usando objeto UIView()



```swift

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

```

## 
- Abaixo alogaritimo para executar um player de video pela url 
- Se reparar o playerViewController ira fornecer uma view
- Com a propriedade frame  na playerViewController cabe internamente na view viTrailer através do método bounds
- Se eu colocar frame  ao invés de bounds na viTrailer, respeitaria inclusive o eixo x e y, neste caso não e um comportamento que desejo

```swift

func watchMovie() {
  if let url = URL(string: trailer!.url){
	player = AVPlayer(url: url)
	playerViewController = AVPlayerViewController()
	playerViewController?.player = player
	playerViewController?.showsPlaybackControls = true
	playerViewController?.player?.play()
	playerViewController?.view.frame = viTrailer.bounds
	viTrailer.addSubview(playerViewController!.view)
}

```



