

import UIKit
class InfoViewController: UIViewController {
    
    private var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Press ", for: .normal)
        button.setTitleColor(.systemMint, for: .normal)
        
        return button
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        view.addSubview(actionButton)
        setUp()
        
        actionButton.addTarget(self, action: #selector(buttonPressed(_sender: )), for: .touchUpInside)
    }
    
    private func setUp(){
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
        actionButton.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -20 ),
        
        actionButton.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
        
        actionButton.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
        actionButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc func buttonPressed(_sender: Any){
        
        let alertController = UIAlertController(title: "Вход", message: "Выберите действие ", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Далее", style: .default){(action) in
            print("Добро пожаловать !")
        }
        let alertAction1 = UIAlertAction(title: "Отмена", style: .cancel){(action1) in print("Нажмите далее для входа !")}
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion:  nil)
    }
    
    
}

