

import UIKit



class FeedViewController: UIViewController {
    
    private let textView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 0.3
        view.layer.borderColor = UIColor.black.cgColor
        return view
    }()
    
    private lazy var wordField: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
       
        
        return field
    }()
    
    private lazy var checkGuessButton = CustomButton(title: NSLocalizedString("feed_checkButton", comment: "-"), bgColor: .systemBlue, action: { [ weak self ] in
        let feed = FeedModel()
        let userWord = self?.wordField.text ?? ""
        if feed.check(word: userWord) == true {
            self?.wordLabel.backgroundColor = .green
        } else {
            self?.wordLabel.backgroundColor = .red
        }
    }
    )
    
    private lazy var wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray3
        label.layer.cornerRadius = 10
        label.layer.borderWidth = 0.5
        label.layer.borderColor = UIColor.black.cgColor
        label.clipsToBounds = true
        
        return label
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("feed_tapButton", comment: "-"), for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 10
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var mapButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("feed_mapButton", comment: "-"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(mapButtonPressed), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var mapButton1: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("feed_mapButton1", comment: "-"), for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(mapButtonPressed1), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("feed_title", comment: "-")
        view.backgroundColor = .white
        layout()
    
    }
    
    //MARK: - Layout
    
    
    private func layout() {
        
        checkGuessButton.translatesAutoresizingMaskIntoConstraints = false
        
        textView.addSubview(wordField)
        view.addSubview(checkGuessButton)
        view.addSubview(textView)
        view.addSubview(wordLabel)
        view.addSubview(pushButton)
        view.addSubview(mapButton1)
        view.addSubview(mapButton)
        
        NSLayoutConstraint.activate([
            textView.heightAnchor.constraint(equalToConstant: 50),
            textView.widthAnchor.constraint(equalToConstant: 300),
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            
            wordField.centerYAnchor.constraint(equalTo: textView.centerYAnchor),
            wordField.heightAnchor.constraint(equalToConstant: 50),
            wordField.leadingAnchor.constraint(equalTo: textView.leadingAnchor ,constant: 7),
            wordField.rightAnchor.constraint(equalTo: textView.rightAnchor),
            
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            checkGuessButton.widthAnchor.constraint(equalToConstant: 300),
            checkGuessButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkGuessButton.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 300),
            
            wordLabel.heightAnchor.constraint(equalToConstant: 100),
            wordLabel.widthAnchor.constraint(equalToConstant: 200),
            wordLabel.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 50),
            wordLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            pushButton.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor,constant: 30),
            pushButton.widthAnchor.constraint(equalToConstant: 150),
            pushButton.heightAnchor.constraint(equalToConstant: 40),
            pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mapButton1.heightAnchor.constraint(equalToConstant: 50),
            mapButton1.widthAnchor.constraint(equalToConstant: 150),
            mapButton1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            mapButton1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mapButton.heightAnchor.constraint(equalToConstant: 50),
            mapButton.widthAnchor.constraint(equalToConstant: 150),
            mapButton.bottomAnchor.constraint(equalTo: mapButton1.topAnchor, constant: -30),
            mapButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    //MARK: - Func
    
    
    @objc private func buttonPressed(){
        let infoViewController = InfoViewController()
        navigationController?.pushViewController(infoViewController, animated: true)
    }
    
    @objc private func mapButtonPressed() {
        let viewController = MapViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc private func mapButtonPressed1() {
        let viewController = SecondMapViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}


