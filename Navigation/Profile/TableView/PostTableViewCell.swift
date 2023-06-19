//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Денис Кузьминов on 18.06.2023.
//

import Foundation
import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let id = "PostTableViewCell"
    
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
    
//--------------------------------------------Func---------------------------------------------------------
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        tuneView()
        addSub()
        setUp()
        
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
    }
    
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
            viewsView.bottomAnchor.constraint(equalTo: postUIView.bottomAnchor, constant: -10)
        ])
        
       
        
            
        
    }
    

        
    func configure(post: Post) {
        titlePost.text = post.author
        postView.image = post.image
        descriptionPost.text = post.description
        likesView.text = "Likes: \(post.likes)"
        viewsView.text = "Views: \(post.views)"
    }

        
}

