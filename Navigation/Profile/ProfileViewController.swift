
import UIKit

class ProfileViewController: UIViewController {
    
    
    private var profileHeaderView: ProfileHeaderView = {
        let feed = ProfileHeaderView()
        feed.backgroundColor = .lightGray
        
        return feed
    }()
        
    
     override func viewDidLoad(){
        super.viewDidLoad()
         
         view.backgroundColor = .white 
         view.addSubview(profileHeaderView)
   }
    
     override func viewWillLayoutSubviews() {
         profileHeaderView.frame = view.safeAreaLayoutGuide.layoutFrame
    }
    
    
}
