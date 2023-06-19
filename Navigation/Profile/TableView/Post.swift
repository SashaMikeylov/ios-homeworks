//
//  Post.swift
//  Navigation
//
//  Created by Денис Кузьминов on 27.05.2023.
//

import UIKit

struct Post {
    let author: String
    var description: String
    let image: UIImage
    var views: Int
    var likes: Int
}
struct Posts{
    static func makePost() -> [Post]{
        [
            .init(author: "Game of Trones - Fan", description: jhon, image: UIImage(named: "Jhon")!, views: 108600, likes: 34679),

            .init(author: "Game center", description: witcher, image: UIImage(named: "Witcher")!, views: 23456, likes: 1234),
            
            Post(author: "Apple", description: apple, image: UIImage(named: "Apple")!, views: 508747, likes: 257859),
            
            Post(author: "Social news", description: ilon, image: UIImage(named: "Ilon")!, views: 45677, likes: 6897)
        ]
    }
}

//-----------------------------------------Description----------------------------------------------------


var jhon = "Джон Сноу признался, что был влюблен в Эмилию Кларк (Дейнерис Таргариен)."


var witcher = "CD Projekt как гром среди ясного неба анонсировала нового «Ведьмака». Никаких деталей касательно сюжета не раскрывают."

var apple = "iOS 17 на данный момент оставила двоякое впечатление у пользователей Айфонов: с одной стороны, Apple уже представила ряд нестандартных нововведений. "

var ilon = "В будущем именно Маск имеет все шансы стать первым триллионером на планете. Амбициозный предприниматель планирует изменить индустрию транспорта и интернета. "
