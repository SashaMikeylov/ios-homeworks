

import UIKit



class FeedViewController: UIViewController{
    
    
    
    private lazy var postButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var postButton1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGray5
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var postStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.clipsToBounds = true
        
        stack.spacing = 10
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        
        
        stack.addArrangedSubview(postButton)
        stack.addArrangedSubview(postButton1)
        
        return stack
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Posts"
        view.backgroundColor = .white
        view.addSubview(postStack)
        setUp()
        
    }
    
    private func setUp(){
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            postStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            postStack.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            postStack.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor,constant: 20),
            postStack.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor,constant: -20)
            
        ])
    }
    
    @objc func buttonPressed(_sender: UIButton){
            let postViewController = PostViewController()
            navigationController?.pushViewController(postViewController, animated: true)
    }
    
    
}


