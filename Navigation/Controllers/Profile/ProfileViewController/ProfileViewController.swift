
import UIKit
import StorageService

class ProfileViewController: UIViewController {
    
    
    
    private let tablePost: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = UIColor(named: "white")
        
        return table
    }()

    
     override func viewDidLoad(){
         super.viewDidLoad()
         
         #if DEBUG
         view.backgroundColor = UIColor(named: "white")
         #else
         view.backgroundColor = UIColor(named: "white")
         #endif
         title = "Posts".localized
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
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        }
        
        if section == 1 {
         return  posts.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.id, for: indexPath) as? PhotosTableViewCell else {fatalError()}
            return cell
        }
        
        
        
        if indexPath.section == 1 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else { return UITableViewCell() }
            let postik = posts[indexPath.row]
            cell.configure(post: postik)
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultId", for: indexPath)
        return cell
        
    }
}

extension ProfileViewController: UITableViewDelegate {
        
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            
            if section == 0 {
                guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.id) as? ProfileHeaderView else { fatalError() }
                return header
            }
            return nil
        }
        
            
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
            if indexPath.section == 0 {
                let photosViewController = PhotosViewController ()
                navigationController?.pushViewController(photosViewController, animated: true)
            }
        }
}


