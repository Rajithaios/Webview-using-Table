
import UIKit
import WebKit

class Webview: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var web: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       // web.uiDelegate = self as? WKUIDelegate
    }
    

    

}
