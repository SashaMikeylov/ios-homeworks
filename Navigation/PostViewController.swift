

import UIKit

class PostViewController: UIViewController{
    
    var titlePost: String = "Postik"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationItem.title = titlePost
        view.backgroundColor = .cyan
        
        let button = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(closeTVC))
        navigationItem.rightBarButtonItem = button
    }
    @objc func closeTVC(){
        let infoViewController = InfoViewController()
        
        infoViewController.modalTransitionStyle = .coverVertical
        infoViewController.modalPresentationStyle = .automatic
        
        present(infoViewController, animated: true)
    }
    
}


