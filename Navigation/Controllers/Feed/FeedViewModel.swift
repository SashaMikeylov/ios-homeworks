//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Денис Кузьминов on 09.08.2023.
//

import Foundation

final class FeedViewModel {
    
    private let feedModel: FeedModel
    
   // var callBack: (() -> Void)?
    
    init(feedModel: FeedModel) {
        self.feedModel = feedModel
    }
    
    func check(word: String) -> Bool {
        word == feedModel.secretWord
   }
    
    
}
