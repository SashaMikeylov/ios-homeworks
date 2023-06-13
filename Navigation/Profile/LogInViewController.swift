//
//  LogInViewController.swift
//  Navigation
//
//  Created by Денис Кузьминов on 13.06.2023.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {
    
    private lazy var vkLogo: UIView = {
        let logo = UIView()
        logo.layer.contents = UIImage(named: "logIn")?.cgImage
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        return logo
    }()
    
    private lazy var ll: UIView = {
        let d = UIView()
        d.translatesAutoresizingMaskIntoConstraints = false
        d.backgroundColor = .systemGray6
        d.layer.borderColor = UIColor.lightGray.cgColor
        d.layer.borderWidth = 0.5
        d.layer.cornerRadius = 10
        
        
        return d
    }()
    private lazy var emailFeed: UITextField = {
        let feed = UITextField()
        feed.translatesAutoresizingMaskIntoConstraints = false
        feed.placeholder = " Email or phone"
        feed.backgroundColor = .systemGray6
        feed.textColor = .black
        feed.layer.borderColor = UIColor.lightGray.cgColor
        feed.layer.borderWidth = 0.5
        feed.layer.cornerRadius = 10
        feed.font = UIFont.systemFont(ofSize: 16)
        feed.autocapitalizationType = .none
    
        return feed
    }()
    
    private lazy var passworFeed: UITextField = {
        let feed = UITextField()
        feed.translatesAutoresizingMaskIntoConstraints = false
        feed.placeholder = " Password"
        feed.backgroundColor = .systemGray6
        feed.textColor = .black
        feed.layer.borderColor = UIColor.lightGray.cgColor
        feed.layer.borderWidth = 0.5
        feed.layer.cornerRadius = 10
        feed.font = UIFont.systemFont(ofSize: 16)
        feed.autocapitalizationType = .none
        feed.isSecureTextEntry = true
    
        
        
        return feed
    }()
    
    private lazy var logButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = .black
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "logButton"), for: .normal)
        
        
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tabBarController?.tabBar.isHidden = true
        
        
        
        addSub()
        setUp()
    }
    
    private func addSub(){
       
        view.addSubview(vkLogo)
        view.addSubview(emailFeed)
        view.addSubview(passworFeed)
        view.addSubview(logButton)
        
    }
//---------------------------------------------setUp-------------------------------------------------------
    
    private func setUp(){
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            vkLogo.heightAnchor.constraint(equalToConstant: 100),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            vkLogo.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 120),
            vkLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            emailFeed.topAnchor.constraint(equalTo: vkLogo.bottomAnchor,constant: 120),
            emailFeed.heightAnchor.constraint(equalToConstant: 50),
            emailFeed.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            emailFeed.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            passworFeed.topAnchor.constraint(equalTo: emailFeed.bottomAnchor),
            passworFeed.heightAnchor.constraint(equalToConstant: 50),
            passworFeed.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            passworFeed.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            logButton.topAnchor.constraint(equalTo: passworFeed.bottomAnchor, constant: 16),
            logButton.heightAnchor.constraint(equalToConstant: 50),
            logButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            logButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            
            ll.topAnchor.constraint(equalTo: vkLogo.bottomAnchor,constant: 120),
            ll.heightAnchor.constraint(equalToConstant: 50),
            ll.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16),
            ll.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
        ])
    }
//----------------------------------------------------------------------------------------------------- ---
    
}

