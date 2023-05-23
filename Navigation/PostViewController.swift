

import UIKit

class PostViewController: UIViewController{
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Вернуться", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Post"
        
        view.backgroundColor = .blue
        view.addSubview(actionButton)
        
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor, constant: 20),
            
            actionButton.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor,constant: -20),
            
            actionButton.centerYAnchor.constraint(equalTo: safeAreaGuide.centerYAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        actionButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        
    }
    @objc func buttonPressed(_sender: UIButton){
        dismiss(animated: true)
    }
    
    
}


