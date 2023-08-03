//
//  Photos.swift
//  Navigation
//
//  Created by Денис Кузьминов on 21.06.2023.
//

import Foundation
import UIKit
import iOSIntPackage

struct Photo{
    let id: Int
    let photoName: String
}

struct Photos{
    static func make() -> [Photo]{[
        
        Photo(id: 1, photoName: "1"),
        Photo(id: 2, photoName: "2"),
        Photo(id: 3, photoName: "3"),
        Photo(id: 4, photoName: "4"),
        Photo(id: 5, photoName: "5"),
        Photo(id: 6, photoName: "6"),
        Photo(id: 7, photoName: "7"),
        Photo(id: 8, photoName: "8"),
        Photo(id: 9, photoName: "9"),
        Photo(id: 10, photoName: "10"),
        Photo(id: 11, photoName: "11"),
        Photo(id: 12, photoName: "12"),
        Photo(id: 13, photoName: "13"),
        Photo(id: 14, photoName: "14"),
        Photo(id: 15, photoName: "15"),
        Photo(id: 16, photoName: "16"),
        Photo(id: 17, photoName: "17"),
        Photo(id: 18, photoName: "18"),
        Photo(id: 19, photoName: "19"),
        Photo(id: 20, photoName: "20"),
        Photo(id: 21, photoName: "21"),
        Photo(id: 22, photoName: "22"),
        Photo(id: 23, photoName: "23"),
        Photo(id: 24, photoName: "24"),
        Photo(id: 25, photoName: "25"),
        Photo(id: 26, photoName: "26"),
        Photo(id: 27, photoName: "27"),

    ]}
    
    
}


let photoGAllery = [
    UIImage(named: "1")!,
    UIImage(named: "2")!,
    UIImage(named: "3")!,
    UIImage(named: "4")!,
    UIImage(named: "5")!,
    UIImage(named: "6")!,
    UIImage(named: "7")!,
    UIImage(named: "8")!,
    UIImage(named: "9")!,
    UIImage(named: "10")!,
    UIImage(named: "11")!,
    UIImage(named: "12")!,
    UIImage(named: "13")!,
    UIImage(named: "14")!,
    UIImage(named: "15")!,
    UIImage(named: "16")!,
    UIImage(named: "17")!,
    UIImage(named: "18")!,
    UIImage(named: "19")!,
    UIImage(named: "20")!,
    UIImage(named: "21")!,
    UIImage(named: "22")!,
    UIImage(named: "23")!,
    UIImage(named: "24")!,
    UIImage(named: "25")!,
    UIImage(named: "26")!,
    UIImage(named: "27")!
]

let facade = ImagePublisherFacade()
let setFacade: () = facade.addImagesWithTimer(time: 1, repeat: 20, userImages: photoGAllery)


