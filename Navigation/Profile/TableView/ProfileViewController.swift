
import UIKit

class ProfileViewController: UIViewController {
    
    var posts = Posts.makePost()
    
    private let tablePost: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()

    
    
    
     override func viewDidLoad(){
         super.viewDidLoad()
         view.backgroundColor = .white
         title = "Posts"
         tabBarController?.tabBar.isHidden = false
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
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    }
}


