//
//  FavoritePostsViewController.swift
//  Navigation
//
//  Created by Денис Кузьминов on 28.10.2023.
//

import UIKit

final class FavoritePostsViewControllerL: UIViewController {
    
    
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    //MARK: - Life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = NSLocalizedString("favorite_title", comment: "-")
        navigationController?.navigationBar.prefersLargeTitles = true
        layout()
        tableTune()
        navBarTune()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    //MARK: - Layout
    
    private func layout() {
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
    
    //MARK: - Func
    
    private func tableTune() {
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    private func navBarTune() {
        let navBarButtton = UIBarButtonItem(title: NSLocalizedString("favorite_deleteButton", comment: "-"), style: .plain, target: self, action: #selector(barButtonAcion))
        navigationItem.rightBarButtonItem = navBarButtton
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: "", message: NSLocalizedString("favorite_alert", comment: "-"), preferredStyle: .alert)
        let alertAction1 = UIAlertAction(title: NSLocalizedString("favorite_deleteButton", comment: "-"), style: .default) { _ in
            CoreDataService.shared.deletePosts()
            self.tableView.reloadData()
        }
        let alertAction2 = UIAlertAction(title: NSLocalizedString("favorite_cancelButton" , comment: "-"), style: .cancel)
        alertController.addAction(alertAction2)
        alertController.addAction(alertAction1)
        present(alertController, animated: true)
    }
    
    //MARK: - Objc func
    
    
    @objc private func barButtonAcion() {
        showAlert()
    }
}


extension FavoritePostsViewControllerL: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CoreDataService.shared.fetchPosts().count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else {return UITableViewCell()}
        
        cell.configure(post: CoreDataService.shared.fetchPosts()[indexPath.row])
        return cell
    }
    
    
}
