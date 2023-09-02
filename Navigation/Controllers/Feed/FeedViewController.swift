

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
    
    private lazy var checkGuessButton = CustomButton(title: "Check", bgColor: .systemBlue, action: { [ weak self ] in
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
    
    
    //MARK: - Life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Posts"
        view.backgroundColor = .white
        layout()
        
        
//        checkGuessButton.callBack = { [ weak self ] in
//            let feed = FeedModel()
//            let userWord = self?.wordField.text ?? ""
//            if feed.check(word: userWord) == true {
//                self?.wordLabel.backgroundColor = .green
//            } else {
//                self?.wordLabel.backgroundColor = .red
//            }
//        }
    }
    
    //MARK: - Layput
    
    
    private func layout() {
        
        checkGuessButton.translatesAutoresizingMaskIntoConstraints = false
        
        textView.addSubview(wordField)
        view.addSubview(checkGuessButton)
        view.addSubview(textView)
        view.addSubview(wordLabel)
        
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
            
        ])
    }
    
    //MARK: - Func
    
    
   
    
    
}


