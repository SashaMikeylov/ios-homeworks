//
//  StringExtension.swift
//  Navigation
//
//  Created by Денис Кузьминов on 14.12.2023.
//

import Foundation

extension String {
    
    var localized: String {
        NSLocalizedString(self, comment: self)
    }
}
