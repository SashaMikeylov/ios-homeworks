

import UIKit

class PostViewController: UIViewController{
    
    var titlePost: String = "Postik"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = titlePost
        
        view.backgroundColor = .blue
        
        
        
        
       
        
    
        
        let button = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(closeTVC))
        navigationItem.rightBarButtonItem = button
    }
    @objc func closeTVC(){
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController,  animated: true)
    }
    
}


