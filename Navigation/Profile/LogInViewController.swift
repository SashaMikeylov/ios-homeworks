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
        feed.keyboardType = UIKeyboardType.default
        feed.returnKeyType = UIReturnKeyType.done
        feed.clearButtonMode = UITextField.ViewMode.whileEditing
        feed.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        feed.delegate = self

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
        feed.keyboardType = UIKeyboardType.default
        feed.returnKeyType = UIReturnKeyType.done
        feed.clearButtonMode = UITextField.ViewMode.whileEditing
        feed.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        feed.delegate = self


        return feed
    }()

    private lazy var logButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "logButton"), for: .normal)
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)


        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = true
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .white
        view.center = view.center
        //view.contentSize = CGSize(width: 1000, height: 1000)

        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        addSub()
        setUp()
        setupKeyboardObservers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
        setupKeyboardObservers()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //removeKeyboard()
    }
    
    private func addSub(){
       
        
        view.addSubview(scrollView)
        scrollView.addSubview(vkLogo)
        scrollView.addSubview(emailFeed)
        scrollView.addSubview(passworFeed)
        scrollView.addSubview(logButton)
        
    }
//---------------------------------------------setUp-------------------------------------------------------
    
    private func setUp(){
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),

            
            vkLogo.heightAnchor.constraint(equalToConstant: 100),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            vkLogo.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            vkLogo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            
            emailFeed.topAnchor.constraint(equalTo: vkLogo.bottomAnchor,constant: 120),
            emailFeed.heightAnchor.constraint(equalToConstant: 50),
            emailFeed.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16),
            emailFeed.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 380),

            passworFeed.topAnchor.constraint(equalTo: emailFeed.bottomAnchor),
            passworFeed.heightAnchor.constraint(equalToConstant: 50),
            passworFeed.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16),
            passworFeed.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 380),

            logButton.topAnchor.constraint(equalTo: passworFeed.bottomAnchor, constant: 16),
            logButton.heightAnchor.constraint(equalToConstant: 50),
            logButton.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 16),
            logButton.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 380),


        ])
    }
//----------------------------------------------------------------------------------------------------- ---
    private func setupKeyboardObservers(){
        
        let noficiationCenter = NotificationCenter.default
        
        noficiationCenter.addObserver(self, selector: #selector(self.willShowKeyboard(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        noficiationCenter.addObserver(self, selector: #selector(self.willHIdeKeyboard(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    private func removeKeyboard(){
        let notificion = NotificationCenter.default
        notificion.removeObserver(self)
    }
    @objc func willShowKeyboard(_ notification: NSNotification){
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
        
    }
    
    @objc func willHIdeKeyboard(_ notification: NSNotification){
        scrollView.contentInset.bottom = 0.0
    }
    
    @objc func actionButton(){
        let profileViewController = ProfileViewController()
        navigationController?.pushViewController(profileViewController, animated: true)
    }
}

extension LogInViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
