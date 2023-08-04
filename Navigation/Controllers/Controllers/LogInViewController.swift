//
//  LogInViewController.swift
//  Navigation
//
//  Created by Денис Кузьминов on 13.06.2023.
//

import Foundation
import UIKit


protocol LoginViewControllerDelegate {
    func check(login: String, password: String) -> Bool
}

struct LoginInspector: LoginViewControllerDelegate {
    
    func check(login: String, password: String) -> Bool {
        return Checker.shared.check(login: login, password: password)
    }
}

//MARK: - main Class

class LogInViewController: UIViewController {
    
    
    var loginDelegate: LoginViewControllerDelegate?
    
    private lazy var vkLogo: UIView = {
        let logo = UIView()
        logo.layer.contents = UIImage(named: "logIn")?.cgImage
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        return logo
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.backgroundColor = .white
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.layer.borderColor = UIColor.lightGray.cgColor
        stack.layer.borderWidth = 0.5
        stack.layer.cornerRadius = 10
        
        
        return stack
    }()
    
    private lazy var line: UIView = {
        let line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .lightGray
        
        return line
    }()
    
    private lazy var emailFeed: UITextField = {
        let feed = UITextField()
        feed.translatesAutoresizingMaskIntoConstraints = false
        feed.placeholder = " User login"
        feed.backgroundColor = .systemGray6
        feed.textColor = .black
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
        feed.placeholder = " User password"
        feed.backgroundColor = .systemGray6
        feed.textColor = .black
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
    
    
    private lazy var logButton = CustomButton(title: "Log In", bgColor: .systemBlue, action: {
        [ weak self ] in
        if self?.checker() == true {
            let profileViewController = ProfileViewController()
            self?.navigationController?.pushViewController(profileViewController, animated: true)
        } else {
            self?.allert()
        }
    })
    
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.backgroundColor = .white
        
        
        
        return view
    }()
    
    private lazy var contenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        
        return view
        
    }()
    
    
    
    
    //MARK: -Life
    
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
    
// MARK: -Func
    
    private func addSub(){
        
        view.addSubview(scrollView)
        
        
        contenView.addSubview(stackView)
        stackView.addSubview(emailFeed)
        stackView.addSubview(passworFeed)
        stackView.addSubview(line)
        contenView.addSubview(vkLogo)
        contenView.addSubview(logButton)
        scrollView.addSubview(contenView)
        
        
    }
    //MARK: -SetUp
    
    private func setUp(){
        
        logButton.translatesAutoresizingMaskIntoConstraints = false
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.leftAnchor.constraint(equalTo: safeArea.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: safeArea.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            
            contenView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contenView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
            contenView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contenView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contenView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contenView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            vkLogo.heightAnchor.constraint(equalToConstant: 100),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            vkLogo.topAnchor.constraint(equalTo: contenView.topAnchor, constant: 120),
            vkLogo.centerXAnchor.constraint(equalTo: contenView.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            stackView.rightAnchor.constraint(equalTo: contenView.rightAnchor, constant: -16),
            stackView.leftAnchor.constraint(equalTo: contenView.leftAnchor, constant: 16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            emailFeed.topAnchor.constraint(equalTo: stackView.topAnchor),
            emailFeed.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            emailFeed.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            emailFeed.heightAnchor.constraint(equalToConstant: 50),
            
            passworFeed.topAnchor.constraint(equalTo: emailFeed.bottomAnchor),
            passworFeed.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            passworFeed.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            passworFeed.heightAnchor.constraint(equalToConstant: 50),
            
            line.heightAnchor.constraint(equalToConstant: 0.5),
            line.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            line.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            line.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            
            logButton.topAnchor.constraint(equalTo: passworFeed.bottomAnchor, constant: 16),
            logButton.heightAnchor.constraint(equalToConstant: 50),
            logButton.leftAnchor.constraint(equalTo: contenView.leftAnchor, constant: 16),
            logButton.rightAnchor.constraint(equalTo: contenView.rightAnchor, constant: -16),
            
            
            
        ])
    }
    //MARK: -func
    
    private func setupKeyboardObservers(){
        
        let noficiationCenter = NotificationCenter.default
        
        noficiationCenter.addObserver(self, selector: #selector(willShowKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        noficiationCenter.addObserver(self, selector: #selector(willHIdeKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func checker() -> Bool {
       
        LoginInspector().check(login: emailFeed.text ?? "", password: passworFeed.text ?? "")
    }
    
    private func allert(){
        let allert = UIAlertController(title: "Wrong login or password ", message: "Try again !", preferredStyle: .alert)
        let allerAction = UIAlertAction(title: "Try again", style: .cancel)
        allert.addAction(allerAction)
        present(allert, animated: true)
    }
    
    //MARK: -objc func
    
    
    @objc func willShowKeyboard(_ notification: NSNotification){
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }
    
    
    @objc func willHIdeKeyboard(_ notification: NSNotification){
        scrollView.contentInset.bottom = 0.0
    }
}
    
extension LogInViewController: UITextFieldDelegate{
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

