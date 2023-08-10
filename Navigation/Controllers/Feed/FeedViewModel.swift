//
//  FeedViewModel.swift
//  Navigation
//
//  Created by Денис Кузьминов on 09.08.2023.
//

import Foundation

final class FeedViewModel {
    
    enum Action {
        case buttonTapped
        case dontTapped
    }
    
    enum State {
        case initial
        case checking
    }
    
    var checkWord: ((State) -> Void)?
    
    private let feedModel: FeedModel
    
    private (set) var state: State = .initial {
        didSet {
            checkWord?(state)
        }
    }
    
    init(feedModel: FeedModel) {
        self.feedModel = feedModel
    }
    
    func checkAcion(action: Action) {
        
        if action == .buttonTapped {
            state = .checking
        } else {
            state = .initial
        }
            
    }
    
}
