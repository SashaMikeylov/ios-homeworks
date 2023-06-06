
import UIKit


class ProfileHeaderView: UIView{
      
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayer()
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var profileName: UILabel = {
       let nameLabel = UILabel()
        nameLabel.text = "Sanya Mikeylov "
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)

        return nameLabel
    }()

    private lazy var profileAvatar: UIView = {
        let avatar = UIView()
        avatar.translatesAutoresizingMaskIntoConstraints = false
        avatar.backgroundColor = .white

        return avatar
    }()

    private lazy var profileStatus: UILabel = {
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

        return button
    }()

    private lazy var buttonText: UILabel = {
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

        return textField
    }()
//-------------------------------------SetupConstraint----------------------------------------

  func setUp(){
      
      addSubview(profileAvatar)
      addSubview(profileStatus)
      addSubview(profileButton)
      addSubview(buttonText)
      addSubview(statusField)
      addSubview(profileName)
      
      NSLayoutConstraint.activate([
        profileName.centerXAnchor.constraint(equalTo: centerXAnchor),
        profileName.topAnchor.constraint(equalTo: topAnchor,constant: 27)
      ])
      
      NSLayoutConstraint.activate([
            profileName.topAnchor.constraint(equalTo: self.topAnchor,constant: 27),
            profileName.centerXAnchor.constraint(equalTo: self.centerXAnchor)
      ])
      
        NSLayoutConstraint.activate([
            profileAvatar.heightAnchor.constraint(equalToConstant: 100),
            profileAvatar.widthAnchor.constraint(equalToConstant: 100),
            profileAvatar.topAnchor.constraint(equalTo: self.topAnchor,constant: 16),
            profileAvatar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            //profileAvatar.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -16)
            profileAvatar.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -52)
        ])
      
        NSLayoutConstraint.activate([
            profileStatus.leftAnchor.constraint(equalTo: profileAvatar.rightAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            profileButton.heightAnchor.constraint(equalToConstant: 50),
            profileButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            //profileButton.topAnchor.constraint(equalTo: profileStatus.bottomAnchor, constant: 34),
            profileButton.topAnchor.constraint(equalTo: profileStatus.bottomAnchor, constant: 70),
            profileButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            profileButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16)

        ])

        NSLayoutConstraint.activate([
            buttonText.centerXAnchor.constraint(equalTo: profileButton.centerXAnchor),
            buttonText.centerYAnchor.constraint(equalTo: profileButton.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            statusField.heightAnchor.constraint(equalToConstant: 40),
            statusField.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            statusField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            statusField.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 130),
            statusField.topAnchor.constraint(equalTo: self.topAnchor, constant: 110)
        ])
    }
//----------------------------------SetupLayer-------------------------------------------

    private func setLayer(){

        profileButton.layer.cornerRadius = 4
        profileButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        profileButton.layer.shadowRadius = 4
        profileButton.layer.shadowColor = UIColor.black.cgColor
        profileButton.layer.shadowOpacity = 0.7

        profileAvatar.layer.cornerRadius = 50
        profileAvatar.layer.contents = UIImage(named:"profileAvatar")?.cgImage
        profileAvatar.layer.borderWidth = 3
        profileAvatar.layer.borderColor = UIColor.white.cgColor
        profileAvatar.layer.masksToBounds = true

        statusField.layer.borderWidth = 1
        statusField.layer.borderColor = UIColor.black.cgColor
        statusField.layer.cornerRadius = 12

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


