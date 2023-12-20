

import UIKit

final class InfoViewController: UIViewController {
    
    private lazy var button = CustomButton(title: "Press", bgColor: .systemBlue, action: { [weak self] in
        let alertController = UIAlertController(title: "Вход", message: "Выберите действие ", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Далее", style: .default){(action) in
            print("Добро пожаловать !")
        }
        let alertAction1 = UIAlertAction(title: "Отмена", style: .cancel){(action1) in print("Нажмите далее для входа !")}
        
        alertController.addAction(alertAction1)
        alertController.addAction(alertAction)
        self?.present(alertController, animated: true, completion:  nil)
    })
    
    
    private lazy var personHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "The person title is"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    private lazy var personTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "black")
        
        NetworkService.request(id: 17) { title in
                    DispatchQueue.main.async {
                        label.text = title
                    }
                }
        
        return label
    }()
    
    private lazy var planetHeader: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Orbital period:"
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        label.textColor = UIColor(named: "black")
        
        return label
    }()
    
    private lazy var planetInfo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(named: "black")
        NetworkService.request(completion: { planet in
            DispatchQueue.main.async {
                label.text = planet.orbitlaPeriod
            }
        })
        
        return label 
    }()
    
//MARK:  -Life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "white")
        setUp()
        
    }
    
//MARK:  -Func
    
    private func setUp(){
        
        view.addSubview(button)
        view.addSubview(personTitle)
        view.addSubview(personHeader)
        view.addSubview(planetHeader)
        view.addSubview(planetInfo)
        
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -60),
        
            personHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            personHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            personTitle.topAnchor.constraint(equalTo: personHeader.bottomAnchor, constant: 10),
            personTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            planetHeader.topAnchor.constraint(equalTo: personTitle.bottomAnchor, constant: 30),
            planetHeader.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            planetInfo.topAnchor.constraint(equalTo: planetHeader.bottomAnchor, constant: 10),
            planetInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    
 //MARK:  -objc Func
    
    
    
}

