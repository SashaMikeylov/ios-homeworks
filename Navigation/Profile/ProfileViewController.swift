
import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Press", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7

        return button
    }()
    private var profileHeaderView: ProfileHeaderView = {
        let feed = ProfileHeaderView()
        feed.translatesAutoresizingMaskIntoConstraints = false
        feed.backgroundColor = .lightGray
        
        return feed
    }()
        
    
     override func viewDidLoad(){
        super.viewDidLoad()
         title = "Profile"
         view.backgroundColor = .white
         tabBarController?.tabBar.isHidden = false
         view.addSubview(profileHeaderView)
         view.addSubview(profileButton)
         setUp()
   }

    private func setUp(){
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            profileHeaderView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            profileHeaderView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            profileHeaderView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
            
            profileButton.heightAnchor.constraint(equalToConstant: 50),
            profileButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            profileButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            profileButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
            
        ])
    }
    
}
