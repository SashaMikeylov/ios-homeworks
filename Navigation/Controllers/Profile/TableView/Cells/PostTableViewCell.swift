//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Денис Кузьминов on 18.06.2023.
//

import StorageService
import UIKit

protocol TapTableViewCellProtocol: AnyObject {
    func tapCell(post: Post)
}



final class PostTableViewCell: UITableViewCell {
    
    static let id = "PostTableViewCell"
    weak var delegate: TapTableViewCellProtocol?
    var favorite: Bool = false
    
    let postUIView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        return view
    }()
    
    let titlePost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        
        return label
    }()
    
    let postView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        
        return image
    }()
    
    let descriptionPost: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        label.numberOfLines = 0
        
        
        return label
    }()
    
    let likesView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        
        return label
    }()
    
    let viewsView: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        
        return label
    }()
    
    private lazy var favoriteChecker: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.black.cgColor
        
        return view
    }()
    
    //MARK: - Func
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        tuneView()
        addSub()
        setUp()
        setRecognizer()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func tuneView(){
        backgroundColor = .white
        accessoryType = .none
        selectionStyle = .none
        
    }
    
    private func addSub(){
        
        
        contentView.addSubview(postUIView)
        postUIView.addSubview(titlePost)
        postUIView.addSubview(descriptionPost)
        postUIView.addSubview(postView)
        postUIView.addSubview(likesView)
        postUIView.addSubview(viewsView)
        postUIView.addSubview(favoriteChecker)
    }
    
    private func setRecognizer() {
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tapPressed))
        recognizer.numberOfTapsRequired = 2
        addGestureRecognizer(recognizer)
    }
    
    //MARK: - Setup
    
    private func setUp(){
        NSLayoutConstraint.activate([
            
            contentView.heightAnchor.constraint(equalToConstant: 600),
            
            postUIView.topAnchor.constraint(equalTo:  topAnchor),
            postUIView.bottomAnchor.constraint(equalTo: bottomAnchor),
            postUIView.rightAnchor.constraint(equalTo: rightAnchor),
            postUIView.leftAnchor.constraint(equalTo: leftAnchor),
            
            
            titlePost.topAnchor.constraint(equalTo: postUIView.topAnchor, constant: 16),
            titlePost.leftAnchor.constraint(equalTo: postUIView.leftAnchor, constant: 16),
            titlePost.rightAnchor.constraint(equalTo: postUIView.rightAnchor, constant: -30),
            
            postView.topAnchor.constraint(equalTo: titlePost.bottomAnchor, constant: 10),
            postView.leftAnchor.constraint(equalTo: postUIView.leftAnchor),
            postView.rightAnchor.constraint(equalTo: postUIView.rightAnchor),
            postView.heightAnchor.constraint(equalTo: postUIView.widthAnchor),
            
            descriptionPost.topAnchor.constraint(equalTo: postView.bottomAnchor, constant: 16),
            descriptionPost.leftAnchor.constraint(equalTo: postUIView.leftAnchor, constant: 16),
            descriptionPost.rightAnchor.constraint(equalTo: postUIView.rightAnchor, constant: -16),
            
            likesView.bottomAnchor.constraint(equalTo: postUIView.bottomAnchor, constant: -10),
            likesView.leftAnchor.constraint(equalTo: postUIView.leftAnchor, constant: 16),
            
            
            viewsView.rightAnchor.constraint(equalTo: postUIView.rightAnchor, constant: -16),
            viewsView.bottomAnchor.constraint(equalTo: postUIView.bottomAnchor, constant: -10),
            
            favoriteChecker.heightAnchor.constraint(equalToConstant: 30),
            favoriteChecker.widthAnchor.constraint(equalToConstant: 30),
            favoriteChecker.rightAnchor.constraint(equalTo: postUIView.rightAnchor, constant: -10),
            favoriteChecker.topAnchor.constraint(equalTo: postUIView.topAnchor, constant: 10),
        ])
    }
    
    
    //MARK: -
    
    
    
    func configure(post: Post) {
        titlePost.text = post.author
        descriptionPost.text = post.descrip
        likesView.text = NSLocalizedString("prof_likes", comment: "-") + ": \(post.likes)"
        viewsView.text = NSLocalizedString("prof_views", comment: "-") + ": \(post.views)"
        postView.image = UIImage(named: post.image)
    }
    
    @objc private func tapPressed() {
       
        favorite = true
        UserDefaults.standard.set(true, forKey: "favorite")
        
        let postAuthor = titlePost.text
        let postsFilter = posts.filter {$0.author == postAuthor}
        let finalPost = postsFilter.first
        
        let author = finalPost?.author ?? ""
        let descrip = finalPost?.descrip ?? ""
        let image = finalPost?.image ?? ""
        let likes = finalPost?.likes ?? 0
        let views = finalPost?.views ?? 0
        
        let postik = Post(author: author, descrip: descrip, image: image, views: views, likes: likes)
      
        CoreDataService.shared.savePost(postik)
        
        favoriteChecker.backgroundColor = .systemYellow
     
    }
    
}
