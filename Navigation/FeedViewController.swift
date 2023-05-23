

import UIKit



class FeedViewController: UIViewController{
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(" Перейти на пост ", for: .normal)
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
        
        
        actionButton.addTarget(self, action: #selector(buttonPressed(_sender:)), for: .touchUpInside)
        struct Post{
            var title: String
        }
        
        var post = Post(title: "Posts")
        
    }
    
    
    @objc func buttonPressed(_sender: UIButton){
            let postViewController = PostViewController()
            
            postViewController.modalTransitionStyle = .coverVertical
            postViewController.modalPresentationStyle = .fullScreen
            
            present(postViewController, animated: true)
    }
    
    
}


