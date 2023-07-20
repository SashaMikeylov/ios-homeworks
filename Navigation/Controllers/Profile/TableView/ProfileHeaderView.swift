

import UIKit
import SnapKit

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

    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7

        return button
    }()

    let buttonText: UILabel = {
        let label = UILabel()
        label.text = "Show status"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

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
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .lightGray
        
        setUp()
    }
        
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//-------------------------------------SetupConstraint----------------------------------------

  func setUp(){
      
      addSubview(profileAvatar)
      addSubview(profileStatus)
      addSubview(profileButton)
      addSubview(buttonText)
      addSubview(statusField)
      addSubview(profileName)
      
      
      profileName.snp.makeConstraints({ make in
          make.centerX.equalToSuperview()
          make.top.equalToSuperview().offset(27)
      })
      
      profileAvatar.snp.makeConstraints({ make in
          make.height.equalTo(100)
          make.width.equalTo(100)
          make.top.equalToSuperview().offset(16)
          make.left.equalToSuperview().offset(16)
      })
      
      profileStatus.snp.makeConstraints({ make in
          make.left.equalTo(profileAvatar).offset(112)
          make.bottom.equalTo(profileName).offset(40)
      })
      
      profileButton.snp.makeConstraints({ make in
          make.height.equalTo(50)
          make.centerX.equalToSuperview()
          make.top.equalToSuperview().offset(175)
          make.left.equalToSuperview().offset(16)
          make.right.equalToSuperview().offset(-16)
      })
      
      buttonText.snp.makeConstraints({ make in
          make.centerX.equalTo(profileButton)
          make.centerY.equalTo(profileButton)
      })
      
      statusField.snp.makeConstraints({ make in
          make.height.equalTo(40)
          make.right.equalToSuperview().offset(-16)
          make.centerX.equalToSuperview()
          make.left.equalToSuperview().offset(130)
          make.top.equalToSuperview().offset(110)
      })
      
    }
//--------------------------------------------------------------------------------------
    @objc private func buttonPressed(){
        profileStatus.text = statusText
        let status = profileStatus.text
        print(status!)
    }
    
   private var statusText: String = ""
    
    @objc private func statusTextChanged(textField: UITextField){
    let text = textField.text
        statusText = text!
   }

}

extension ProfileHeaderView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

