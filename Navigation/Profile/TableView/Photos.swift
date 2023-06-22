//
//  Photos.swift
//  Navigation
//
//  Created by Денис Кузьминов on 21.06.2023.
//

import Foundation
import UIKit

struct Photo{
    let id: Int
    let photo: UIImage
}

struct Photos{
    static func make() -> [Photo]{[

        Photo(id: 1, photo: UIImage(named: "1")!),
        Photo(id: 2, photo: UIImage(named: "2")!),
        Photo(id: 3, photo: UIImage(named: "3")!),
        Photo(id: 4, photo: UIImage(named: "4")!)

    ]}
}


