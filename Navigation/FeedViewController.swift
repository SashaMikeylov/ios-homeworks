

import UIKit



class FeedViewController: UIViewController{
    var post = Post(title: "My post")
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
    }
    
    
    @objc func buttonPressed(_sender: UIButton){
            let postViewController = PostViewController()
            postViewController.titlePost = post.title
            navigationController?.pushViewController(postViewController, animated: true)
            
    }
    
    
}


