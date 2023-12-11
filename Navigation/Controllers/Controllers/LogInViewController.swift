//
//  LogInViewController.swift
//  Navigation
//
//  Created by Денис Кузьминов on 13.06.2023.
//

import Foundation
import UIKit
import FirebaseAuth

protocol LoginViewControllerDelegate {

    func signIn(email: String,
                password: String,
                completion: @escaping (Bool) -> Void)
    
    func checkCredentials(email: String,
                          password: String,
                          completion: @escaping (Bool) -> Void)
    
}


var mainUser: UserBone?

struct LoginInspector: LoginViewControllerDelegate {
    
    func signIn(email: String, password: String, completion: @escaping (Bool) -> Void) {
        CheckerService().signUp(email: email, password: password, completion: { result in
            completion(result)
        })
    }
    
    func checkCredentials(email: String, password: String, completion: @escaping (Bool) -> Void) {
        CheckerService().checkCredentials(email: email, password: password, completion: { result in
            completion(result)
        })
    }
}


//MARK: - main Class

class LogInViewController: UIViewController {
    

    var loginDelegate: LoginViewControllerDelegate?
    var coordinator: FirstFlowCoordinator?
    
    let bruteForceService = BrutForceService()
    
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
        feed.placeholder = NSLocalizedString("log_email", comment: "-")
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
    
    private lazy var passwordFeed: UITextField = {
        let feed = UITextField()
        feed.translatesAutoresizingMaskIntoConstraints = false
        feed.placeholder = NSLocalizedString("log_password", comment: "-")
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
    
    private lazy var emailView: UIView = {
        let feed = UIView()
        feed.translatesAutoresizingMaskIntoConstraints = false
        feed.backgroundColor = .systemGray6
        
        
        return feed
    }()
    
    private lazy var passwordView: UIView = {
        let feed = UIView()
        feed.translatesAutoresizingMaskIntoConstraints = false
        feed.backgroundColor = .systemGray6
        
        
        
        return feed
    }()
    
    
    private lazy var logButton = CustomButton(title: NSLocalizedString("log_siginButton", comment: "-"), bgColor: .systemBlue, action: {
        [ weak self ] in
        self?.SignIn()
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
    
    private lazy var helpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("log_pickupButton", comment: "-"), for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(helpButtonPressed), for: .touchUpInside)
        button.makeSystem()
        
        
        return button
    }()
    
    private lazy var passwordActivityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView ()
        activity.translatesAutoresizingMaskIntoConstraints = false
    
        
        return activity
    }()
    
    private lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("log_siginButton", comment: "-"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        button.layer.borderWidth = 0.5
        button.layer.cornerRadius = 15
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.makeSystem()
        
        return button
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
        stackView.addSubview(emailView)
        stackView.addSubview(passwordView)
        stackView.addSubview(line)
        contenView.addSubview(vkLogo)
        contenView.addSubview(logButton)
        scrollView.addSubview(contenView)
        emailView.addSubview(emailFeed)
        passwordView.addSubview(passwordFeed)
        contenView.addSubview(helpButton)
        passwordView.addSubview(passwordActivityIndicator)
        contenView.addSubview(signUpButton)
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
            vkLogo.topAnchor.constraint(equalTo: contenView.topAnchor, constant: 100),
            vkLogo.centerXAnchor.constraint(equalTo: contenView.centerXAnchor),
            
            stackView.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            stackView.rightAnchor.constraint(equalTo: contenView.rightAnchor, constant: -16),
            stackView.leftAnchor.constraint(equalTo: contenView.leftAnchor, constant: 16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            emailView.topAnchor.constraint(equalTo: stackView.topAnchor),
            emailView.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            emailView.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            emailView.heightAnchor.constraint(equalToConstant: 50),
            
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor),
            passwordView.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            passwordView.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            passwordView.heightAnchor.constraint(equalToConstant: 50),
            
            line.heightAnchor.constraint(equalToConstant: 0.5),
            line.centerYAnchor.constraint(equalTo: stackView.centerYAnchor),
            line.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            line.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            
            logButton.topAnchor.constraint(equalTo: helpButton.bottomAnchor, constant: 16),
            logButton.heightAnchor.constraint(equalToConstant: 50),
            logButton.leftAnchor.constraint(equalTo: contenView.leftAnchor, constant: 16),
            logButton.rightAnchor.constraint(equalTo: contenView.rightAnchor, constant: -16),
            
            passwordFeed.leftAnchor.constraint(equalTo: passwordView.leftAnchor, constant: 7),
            passwordFeed.rightAnchor.constraint(equalTo: passwordView.rightAnchor),
            passwordFeed.topAnchor.constraint(equalTo: passwordView.topAnchor),
            passwordFeed.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor),
            
            emailFeed.leftAnchor.constraint(equalTo: emailView.leftAnchor, constant: 7),
            emailFeed.rightAnchor.constraint(equalTo: emailView.rightAnchor),
            emailFeed.topAnchor.constraint(equalTo: emailView.topAnchor),
            emailFeed.bottomAnchor.constraint(equalTo: emailView.bottomAnchor),
            
            helpButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            helpButton.centerXAnchor.constraint(equalTo: contenView.centerXAnchor),
            
            passwordActivityIndicator.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 1),
            passwordActivityIndicator.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 1),
            passwordActivityIndicator.rightAnchor.constraint(equalTo: passwordView.rightAnchor, constant: -30),
            
            signUpButton.topAnchor.constraint(equalTo: logButton.bottomAnchor, constant: 25),
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signUpButton.heightAnchor.constraint(equalToConstant: 50),
            signUpButton.widthAnchor.constraint(equalToConstant: 90),
        ])
    }
    
    //MARK: -func
    
    private func setupKeyboardObservers(){
        
        let noficiationCenter = NotificationCenter.default
        
        noficiationCenter.addObserver(self, selector: #selector(willShowKeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        noficiationCenter.addObserver(self, selector: #selector(willHIdeKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func SignIn() {
        
        
        coordinator?.showProfile()
//        if passwordFeed.text!.isEmpty || emailFeed.text!.isEmpty {
//            allert(error: .emptyField)
//        }
//        
//        
//        
//        loginDelegate?.signIn(email: emailFeed.text ?? "", password: passwordFeed.text ?? "", completion: { [weak self] result in
//            if result {
//                self?.coordinator?.showProfile()
//            } else {
//                self?.allert(error: .wrongPasswordEmail)
//            }
//        })
    }
    
    private func checkCredentials() {
        
        if passwordFeed.text!.isEmpty || emailFeed.text!.isEmpty {
            allert(error: .emptyField)
        }
        
        loginDelegate?.checkCredentials(email: emailFeed.text ?? "", password: passwordFeed.text ?? "", completion: { [weak self] result in
            if result {
                self?.coordinator?.showProfile()
            } else {
                self?.allert(error: .notAuth)
            }
        })
        
    }
    
    private func allert(error: LoginErrors){
        
        let message: String
        
        switch error {
        case .notAuth:
             message = "Not Auth"
        case .emptyField:
             message = "Empty fields"
        case .wrongPasswordEmail:
             message = "Wrong password or email"
        }
        
        let alert = UIAlertController(title: message, message: "", preferredStyle: .alert)
        let alerAction = UIAlertAction(title: "Try again", style: .cancel)
        alert.addAction(alerAction)
        present(alert, animated: true)
    }
    
    private func helpsAlerts(){
        let alert = UIAlertController(title: "Do you want to guess the password ?", message: "", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Yes", style: .destructive) {_ in
            self.pickUpPAssword()
        }
        let alertAction1 = UIAlertAction(title: "No", style: .cancel)
        alert.addAction(alertAction)
        alert.addAction(alertAction1)
        present(alert, animated: true)
    }
    
    private func pickUpPAssword(){
        
        let queue = DispatchQueue(label: "PickUpQueue", attributes: .concurrent)
        let dispatchWorkItem = DispatchWorkItem {
            self.bruteForceService.bruteForce(passwordToUnlock: "pas")
        }
        
        passwordActivityIndicator.startAnimating()
        passwordFeed.isSecureTextEntry = false
        queue.async(execute: dispatchWorkItem)
        dispatchWorkItem.notify(queue: .main) {
            self.passwordActivityIndicator.stopAnimating()
            self.passwordFeed.text = "pas"
        }
        
    }
    
    //MARK: -objc func
    
    
    @objc func willShowKeyboard(_ notification: NSNotification){
        let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        scrollView.contentInset.bottom += keyboardHeight ?? 0.0
    }
    
    
    @objc func willHIdeKeyboard(_ notification: NSNotification){
        scrollView.contentInset.bottom = 0.0
    }
    
    @objc func helpButtonPressed(){
        helpsAlerts()
    }
    
    @objc private func signUp() {
        checkCredentials()
    }
}

//MARK: -Extensions
    
extension LogInViewController: UITextFieldDelegate {
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

enum LoginErrors: Error {
    case wrongPasswordEmail
    case notAuth
    case emptyField
}
