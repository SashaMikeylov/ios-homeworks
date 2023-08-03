

import UIKit


class ProfileHeaderView: UITableViewHeaderFooterView {
    
    static let id = "ProfileHeaderView"
    
    let profileName: UILabel = {
        let nameLabel = UILabel()
        nameLabel.text = "Sanya Mikeylov "
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        
        return nameLabel
    }()
    
    let profileAvatar: UIView = {
        let avatar = UIView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.backgroundColor = .white
        avatar.layer.cornerRadius = 50
        avatar.layer.contents = UIImage(named:"profileAvatar")?.cgImage
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.layer.masksToBounds = true
        
        return avatar
    }()
    
    let profileStatus: UILabel = {
        let label = UILabel()
        label.text = "waiting for something..."
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        
        return label
    }()
    
    private lazy var profileButton = CustomButton(title: "Show status", bgColor: .systemBlue)
    
    
    
    private lazy var statusField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .white
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.placeholder = "Write your status"
        textField.delegate = self
        textField.keyboardType = .default
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        
        return textField
    }()
    
    //MARK: - Init
    
    override init(reuseIdentifier: String?) {
        
        super.init(reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .lightGray
        
        profileButton.callBack = { [ weak self ] in
            self?.profileStatus.text = self?.statusText
        }
        
        setUp()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Layout
    
    
    func setUp(){
        
        addSubview(profileAvatar)
        addSubview(profileStatus)
        addSubview(profileButton)
        addSubview(statusField)
        addSubview(profileName)
        
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.heightAnchor.constraint(equalToConstant: 240),
            
            
            profileName.leftAnchor.constraint(equalTo: profileAvatar.rightAnchor, constant: 15),
            profileName.topAnchor.constraint(equalTo: topAnchor, constant: 35),
            
            profileAvatar.heightAnchor.constraint(equalToConstant: 100),
            profileAvatar.widthAnchor.constraint(equalToConstant: 100),
            profileAvatar.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
            profileAvatar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            profileAvatar.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -52),
            
            profileStatus.leftAnchor.constraint(equalTo: profileAvatar.rightAnchor, constant: 16),
            
            profileButton.heightAnchor.constraint(equalToConstant: 50),
            profileButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            profileButton.topAnchor.constraint(equalTo: profileStatus.bottomAnchor, constant: 70),
            profileButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            profileButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            
            
            statusField.heightAnchor.constraint(equalToConstant: 40),
            statusField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            statusField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            statusField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 130),
            statusField.topAnchor.constraint(equalTo: self.topAnchor, constant: 110),
            
        ])
    }
    
    //MARK: - Func
    
    func userConfig(user: UserBody){
        profileName.text = user.fullName
        profileStatus.text = user.status
        profileAvatar.layer.contents = user.avatar.cgImage
    }
    
    private var statusText: String = ""
    
    @objc private func statusTextChanged(textField: UITextField) {
        let text = textField.text
        statusText = text!
    }
    
    
}

//MARK: -Extensions


extension ProfileHeaderView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

