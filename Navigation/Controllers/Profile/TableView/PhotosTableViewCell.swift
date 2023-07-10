//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Денис Кузьминов on 21.06.2023.
//

import Foundation
import UIKit

class PhotosTableViewCell: UITableViewCell{
    
    static let id = "PhotosTableViewCell"
    
    private let photoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        
        
        return view
    }()
    
    private let titlePhoto: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .white
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    
    private let firtsPhoto: UIView = {
        let photo = UIView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.cornerRadius = 6
        photo.layer.masksToBounds = true
        
        return photo
    }()
        
    private let secondPhoto: UIView = {
        let photo = UIView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.cornerRadius = 6
        photo.backgroundColor = .black
        photo.layer.masksToBounds = true
        
        return photo
    }()
    
    private let thirdPhoto: UIView = {
        let photo = UIView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.cornerRadius = 6
        photo.backgroundColor = .black
        photo.layer.masksToBounds = true
        
        return photo
    }()
    
    private let fourthPhoto: UIView = {
        let photo = UIView()
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.layer.cornerRadius = 6
        photo.backgroundColor = .black
        photo.layer.masksToBounds = true
        
        return photo
    }()
    private let arrowPhoto: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.contents = UIImage(named: "arrowPhoto")?.cgImage
       
        
        return view
    }()
    
    var photos = Photos.make()
       
//-----------------------------------------------func----------------------------------------------
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSub()
        tuneView()
        configure()
        setUp()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSub(){
        
        contentView.addSubview(photoView)
        photoView.addSubview(titlePhoto)
        photoView.addSubview(firtsPhoto)
        photoView.addSubview(secondPhoto)
        photoView.addSubview(thirdPhoto)
        photoView.addSubview(fourthPhoto)
        photoView.addSubview(arrowPhoto)
        
    }
    
    private func tuneView(){
        backgroundColor = .white
        accessoryType = .none
        selectionStyle = .none
        
    }
    
    private func setUp(){
        
        NSLayoutConstraint.activate([
            
            contentView.heightAnchor.constraint(equalToConstant: 140),
            
            photoView.topAnchor.constraint(equalTo: topAnchor),
            photoView.bottomAnchor.constraint(equalTo: bottomAnchor),
            photoView.rightAnchor.constraint(equalTo: rightAnchor),
            photoView.leftAnchor.constraint(equalTo: leftAnchor),
            
            
            titlePhoto.topAnchor.constraint(equalTo: photoView.topAnchor, constant: 12),
            titlePhoto.leftAnchor.constraint(equalTo: photoView.leftAnchor, constant: 12),
           
            
            firtsPhoto.topAnchor.constraint(equalTo: titlePhoto.bottomAnchor, constant: 12),
            firtsPhoto.leftAnchor.constraint(equalTo: photoView.leftAnchor, constant: 12),
            firtsPhoto.bottomAnchor.constraint(equalTo: photoView.bottomAnchor ,constant: -12),
            firtsPhoto.widthAnchor.constraint(equalToConstant: 87),
            
            secondPhoto.bottomAnchor.constraint(equalTo: photoView.bottomAnchor, constant: -12),
            secondPhoto.leftAnchor.constraint(equalTo: firtsPhoto.rightAnchor, constant: 8),
            secondPhoto.widthAnchor.constraint(equalToConstant: 87),
            secondPhoto.heightAnchor.constraint(equalTo: firtsPhoto.heightAnchor),
            
            thirdPhoto.bottomAnchor.constraint(equalTo: photoView.bottomAnchor, constant: -12),
            thirdPhoto.leftAnchor.constraint(equalTo: secondPhoto.rightAnchor, constant: 8),
            thirdPhoto.widthAnchor.constraint(equalToConstant: 87),
            thirdPhoto.heightAnchor.constraint(equalTo: firtsPhoto.heightAnchor),
            
            fourthPhoto.bottomAnchor.constraint(equalTo: photoView.bottomAnchor, constant: -12),
            fourthPhoto.leftAnchor.constraint(equalTo: thirdPhoto.rightAnchor, constant: 8),
            fourthPhoto.widthAnchor.constraint(equalToConstant: 87),
            fourthPhoto.heightAnchor.constraint(equalTo: firtsPhoto.heightAnchor),
            
            arrowPhoto.topAnchor.constraint(equalTo: photoView.topAnchor, constant: 12),
            arrowPhoto.rightAnchor.constraint(equalTo: photoView.rightAnchor, constant: -12),
            arrowPhoto.widthAnchor.constraint(equalTo: arrowPhoto.heightAnchor),
            arrowPhoto.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
//--------------------------------------configure---------------------------------------------
    
   private func configure(){
        let photos = Photos.make()
        photos.forEach{
            
            
            switch $0.id{
            case 1:
                firtsPhoto.layer.contents =  UIImage(named: $0.photoName)?.cgImage
            case 2:
                secondPhoto.layer.contents = UIImage(named: $0.photoName)?.cgImage
            case 3:
                thirdPhoto.layer.contents = UIImage(named: $0.photoName)?.cgImage
            case 4:
                fourthPhoto.layer.contents = UIImage(named: $0.photoName)?.cgImage
            default:
                print("It's not prewie photos =(")
            }

        }
    }

    
    
}
