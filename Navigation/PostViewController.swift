

import UIKit
struct Posts{
    var title: String
}

class PostViewController: UIViewController{
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" Вернуться ", for: .normal)
        
        
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Posts"
        view.backgroundColor = .systemIndigo
        
        view.addSubview(actionButton)
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 20),
            
            actionButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor,constant: -20),
            
            actionButton.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        actionButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        let tabBarStatus = UITabBarController()
        
        let infoViewController = ViewController()
        infoViewController.title = "Info"
        infoViewController.view.backgroundColor = .clear
        infoViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 0)
        
       
        let controllers = [infoViewController]
        tabBarStatus.viewControllers = controllers.map {
            UINavigationController(rootViewController: $0)
        }
        
        
        
        
        
    }
    
    
    @objc func buttonPressed(_sender: UIButton){
        dismiss(animated: true, completion: nil)
    }
    
    
}


