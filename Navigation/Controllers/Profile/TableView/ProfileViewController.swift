
import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    
    
    
    
    private let tablePost: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()

    
    
    
     override func viewDidLoad(){
         super.viewDidLoad()
         
         #if DEBUG
         view.backgroundColor = .white
         #else
         view.backgroundColor = .systemGray3
         #endif
         title = "Posts"
         tabBarController?.tabBar.isHidden = true
         self.navigationController?.navigationBar.prefersLargeTitles = true
         
         addSub()
         setUp()
         tuneTableView()
   }
    
    
    private func addSub(){
        view.addSubview(tablePost)
    }
    
    
    private func setUp(){
        let safeAresGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            tablePost.topAnchor.constraint(equalTo: safeAresGuide.topAnchor),
            tablePost.rightAnchor.constraint(equalTo: safeAresGuide.rightAnchor),
            tablePost.leftAnchor.constraint(equalTo: safeAresGuide.leftAnchor),
            tablePost.bottomAnchor.constraint(equalTo: safeAresGuide.bottomAnchor),

        ])
    }
    
    func tuneTableView(){
        tablePost.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        tablePost.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.id)
        tablePost.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.id)
       
        
        
        tablePost.dataSource = self
        tablePost.delegate = self
    }
    
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        posts.count + 1
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
                if indexPath.row == posts.count{
                    guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.id, for: indexPath) as? PhotosTableViewCell else {fatalError()}
        
                    return cell
                }
        
                guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
                let postik = posts[indexPath.row]
                cell.configure(post: postik)
        
        
                return cell
        
            }
        
       
}

extension ProfileViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            250
        }
        
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.id) as? ProfileHeaderView else { fatalError() }

           return header
//                    if section == 0{
//                        return ProfileHeaderView()
//                    } else {
//                        return nil
//                    }
        }
        
            
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
            if indexPath.row == posts.count {
                let photosViewController = PhotosViewController ()
                navigationController?.pushViewController(photosViewController, animated: true)
            }
        }
}


