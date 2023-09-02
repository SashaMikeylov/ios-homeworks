//
//  LogInViewController.swift
//  Navigation
//
//  Created by Денис Кузьминов on 13.06.2023.
//

import Foundation
import UIKit



//MARK: - main Class

class LogInViewController: UIViewController {
    
    
    var loginDelegate: LoginViewControllerDelegate?
  //  private let coordinator: FirstFlowCoordinator
    
        
    //MARK: -Life
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
       
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
      //  setupKeyboardObservers()
    }
    
    
// MARK: -Func
    
   
