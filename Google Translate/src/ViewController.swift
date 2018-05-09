
import Cocoa
import WebKit

class ViewController: NSViewController {
    
    var webView: WKWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad();

        // Do any additional setup after loading the view.
        
//        let statusItem = NSStatusBar.system.statusItem(withLength:NSStatusItem.squareLength)
        
        let mainMenu: NSMenu =  NSApplication.shared.mainMenu!
        let itemMenu: NSMenuItem = mainMenu.item(withTitle: "Translator")!
        if itemMenu.hasSubmenu {
            let submenu: NSMenu = itemMenu.submenu!
            let bingItem: NSMenuItem = submenu.item(withTitle: "Bing Translate")!
            let baiduItem: NSMenuItem = submenu.item(withTitle: "Baidu Translate")!
            let googleItem: NSMenuItem = submenu.item(withTitle: "Google Translate")!
            let youdaoItem: NSMenuItem = submenu.item(withTitle: "Youdao Translate")!
            
            bingItem.target = self
            bingItem.action = #selector(_translate_)
            
            baiduItem.target = self
            baiduItem.action = #selector(_translate_)
            
            googleItem.target = self
            googleItem.action = #selector(_translate_)
            
            youdaoItem.target = self
            youdaoItem.action = #selector(_translate_)
        }
        
        let webConfiguration = WKWebViewConfiguration();
        webView = WKWebView(frame: view.bounds, configuration: webConfiguration);
        view.addSubview(webView);
        
        let topConstraint = NSLayoutConstraint(
            item: webView,
            attribute: NSLayoutConstraint.Attribute.top,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.top,
            multiplier: 1,
            constant: 0);
        
        let bottomConstraint = NSLayoutConstraint(
            item: webView,
            attribute: NSLayoutConstraint.Attribute.bottom,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.bottom,
            multiplier: 1,
            constant: 0);
        
        let leadingConstraint = NSLayoutConstraint(
            item: webView,
            attribute: NSLayoutConstraint.Attribute.leading,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.leading,
            multiplier: 1,
            constant: 0);
        
        let trailingConstraint = NSLayoutConstraint(
            item: webView,
            attribute: NSLayoutConstraint.Attribute.trailing,
            relatedBy: NSLayoutConstraint.Relation.equal,
            toItem: view,
            attribute: NSLayoutConstraint.Attribute.trailing,
            multiplier: 1,
            constant: 0);
        
        webView.translatesAutoresizingMaskIntoConstraints = false;
        view.addConstraints([bottomConstraint, topConstraint, leadingConstraint, trailingConstraint]);
        
        let urlStr: String = "https://translate.google.cn/";
        
        loadURLString(urlStr: urlStr)
    }
    
    @objc func _translate_(sender: NSMenuItem) {
        let tag: NSInteger = sender.tag;
        var urlStr: String = "https://translate.google.cn/";
        
        if tag == 1 {
            urlStr = "https://cn.bing.com/translator"
        } else if tag == 2 {
            urlStr = "https://fanyi.baidu.com/"
        } else if tag == 3 {
            // default google 
        } else if tag == 4 {
            urlStr = "http://fanyi.youdao.com/"
        }
        
        loadURLString(urlStr: urlStr)
    }
    
    func loadURLString(urlStr: String) {
        let url = URL(string: urlStr);
        let request = URLRequest(url: url!);
        webView.load(request);
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

