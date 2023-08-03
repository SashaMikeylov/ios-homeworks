//
//  FeedModel.swift
//  Navigation
//
//  Created by Денис Кузьминов on 04.08.2023.
//

import Foundation
import UIKit



class FeedModel {
    
    let secretWord = "Word"
    
   
    
     func check(word: String) -> Bool {
        if word == secretWord {
            return true
        }
        return false
    }
    
}
