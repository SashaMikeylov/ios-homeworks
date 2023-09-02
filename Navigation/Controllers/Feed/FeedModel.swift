//
//  FeedModel.swift
//  Navigation
//
//  Created by Денис Кузьминов on 04.08.2023.
//

import Foundation
import UIKit



final class FeedModel {
    
    let secretWord = "Word"
    
     func check(word: String) -> Bool {
         word == secretWord
    }
}
