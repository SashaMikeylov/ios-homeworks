//
//  CustomButton.swift
//  Navigation
//
//  Created by Денис Кузьминов on 03.08.2023.
//

import Foundation
import UIKit


final class CustomButton: UIButton {
    
    typealias Action = () -> Void
    
    var buttonAction: Action
    
    init(title: String, titleColor: UIColor = .white, bgColor: UIColor, action: @escaping Action) {
        buttonAction = action
        
        super.init(frame: .zero)
        makeSystem()
        setTitle((title), for: .normal)
        backgroundColor = bgColor
        setTitleColor((titleColor), for: .normal)
        layer.cornerRadius = 10
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func buttonTapped(){
        buttonAction()
    }
}

extension UIButton {
    
    func makeSystem(){
        
        addTarget(self, action: #selector(holdOn), for:[
            .touchDown,
            .touchDragInside ])
        
        addTarget(self, action: #selector(holdOff), for: [
            .touchCancel,
            .touchUpOutside,
            .touchDragExit,
            .touchDragOutside,
            .touchUpInside])
    }
            
    @objc func holdOn(){
        UIButton.animate(withDuration: 0.1, animations: {self.alpha = 0.7 } )
    }

    @objc func holdOff(){
        UIButton.animate(withDuration: 0.1, animations: {self.alpha = 1 } )
    }
    
}
