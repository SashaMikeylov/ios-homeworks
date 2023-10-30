//
//  Post.swift
//  Navigation
//


import UIKit
import CoreData

public struct Post {
    public let author: String
    public var descrip: String
    public let image: String
    public var views: Int64
    public var likes: Int64
    
    init(author: String, descrip: String, image: String, views: Int64, likes: Int64) {
        self.author = author
        self.descrip = descrip
        self.image = image
        self.views = views
        self.likes = likes
        
    }
    
    init(postCoreDataModel: PostDataModel) {
        author = postCoreDataModel.author ?? ""
        descrip = postCoreDataModel.descrip ?? ""
        image = postCoreDataModel.image ?? ""
        views = postCoreDataModel.views
        likes = postCoreDataModel.likes
    }
}



let post = Post(author: "Game of Trones - Fan", descrip: jhon, image: "Jhon", views: 108600, likes: 34679)

let post1 = Post(author: "Game center", descrip: witcher, image: "Witcher", views: 23456, likes: 1234)

let post2 = Post(author: "Apple", descrip: apple, image:  "Apple", views: 508747, likes: 257859)

let post3 = Post(author: "Social news", descrip: ilon, image: "Ilon", views: 45677, likes: 6897)

public var posts = [post, post1, post2, post3]

//-----------------------------------------Description----------------------------------------------------


var jhon = "Джон Сноу признался, что был влюблен в Эмилию Кларк (Дейнерис Таргариен)."


var witcher = "CD Projekt как гром среди ясного неба анонсировала нового «Ведьмака». Никаких деталей касательно сюжета не раскрывают."

var apple = "iOS 17 на данный момент оставила двоякое впечатление у пользователей Айфонов: с одной стороны, Apple уже представила ряд нестандартных нововведений. "

var ilon = "В будущем именно Маск имеет все шансы стать первым триллионером на планете. Амбициозный предприниматель планирует изменить индустрию транспорта и интернета. "
