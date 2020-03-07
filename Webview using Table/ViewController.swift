import UIKit

struct artist: Codable {
    let feed: artinfo
}
struct artinfo: Codable {
    let title: String
    let results: [artdetails]
}
struct artdetails: Codable {
    let artistName: String
    let  artistUrl: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var Artist = [artist]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        //cell.buttonlbl.addTarget(Artist.self, action: Selector(onclick()), for: .touchUpInside)
        return cell
    }
    
   
    @IBOutlet weak var table: UITableView!
    @IBAction func ontapButton(_ sender: Any) {
        let webvc = self.storyboard?.instantiateViewController(identifier: "Webview") as! Webview
        self.navigationController?.pushViewController(webvc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json")
        let requesturl = URLRequest(url: url!)
        URLSession.shared.dataTask(with: requesturl) { (data,_,_) in
            guard let sampledata = data else {return}
            do {
                let jsonparsing = try JSONDecoder().decode(artist.self, from: sampledata)
                print(jsonparsing.feed.results[0].artistUrl)
            } catch {}
        }.resume()

    }


}

