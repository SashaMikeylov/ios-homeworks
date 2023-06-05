
import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let feed = ProfileHeaderView(
            frame: CGRect(x: 0, y: 100, width: 400, height: 660))
        feed.translatesAutoresizingMaskIntoConstraints = true
        feed.backgroundColor = .lightGray
        
        return feed
    }()
    
    
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
    
     override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(profileHeaderView)
        profileHeaderView.addSubview(profileName)
        profileHeaderView.addSubview(profileAvatar)
        profileHeaderView.addSubview(profileStatus)
        profileHeaderView.addSubview(profileButton)
        profileButton.addSubview(buttonText)
        setUp()
        setLayer()
    }
//-------------------------------------SetupConstraint----------------------------------------
    
    private func setUp(){
        NSLayoutConstraint.activate([
            profileName.topAnchor.constraint(equalTo: profileHeaderView.topAnchor,constant: 27),
            profileName.centerXAnchor.constraint(equalTo: profileHeaderView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            profileAvatar.heightAnchor.constraint(equalToConstant: 100),
            profileAvatar.widthAnchor.constraint(equalToConstant: 100),
            profileAvatar.topAnchor.constraint(equalTo: profileHeaderView.topAnchor,constant: 16),
            profileAvatar.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            profileAvatar.bottomAnchor.constraint(equalTo: profileButton.topAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            profileStatus.leftAnchor.constraint(equalTo: profileAvatar.rightAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            profileButton.heightAnchor.constraint(equalToConstant: 50),
            profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileButton.topAnchor.constraint(equalTo: profileStatus.bottomAnchor, constant: 34),
            profileButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            profileButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            buttonText.centerXAnchor.constraint(equalTo: profileButton.centerXAnchor),
            buttonText.centerYAnchor.constraint(equalTo: profileButton.centerYAnchor)
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
    }
    
//--------------------------------------------------------------------------------------
    @objc private func buttonPressed(){
        let status = profileStatus.text
        print(status!)
    }
    
    
}
