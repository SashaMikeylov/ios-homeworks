//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Денис Кузьминов on 22.06.2023.
//

import Foundation
import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    let photos = Photos.makePhotos()
    
    var images: [UIImage] = []
    var newAlbum: [UIImage] = []
    private  func castImages(photos: [Photo])  {
       
        
        
        for image in photos {
            let photo = UIImage(named: image.photoName) ?? UIImage()
            images.append(photo)
            
        }
        
        
    }
    
    private let photoCollection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        viewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        viewLayout.minimumLineSpacing = 8
        viewLayout.minimumInteritemSpacing = -8
        viewLayout.sectionInset = .init(top: 8, left: 8, bottom: 8, right: 8)
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tuneCollection()
        tuneView()
        setUp()
        imageTune()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        
    }
    
    private func tuneView(){
        view.backgroundColor = .white
        title = "Photo Gallery"
        view.addSubview(photoCollection)
        
    }
    private func tuneCollection(){
        photoCollection.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.id)
        photoCollection.dataSource = self
    }
    
    private func setUp(){
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            photoCollection.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            photoCollection.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor),
            photoCollection.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor),
            photoCollection.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
        ])
    }
    
    private func imageTune(){
        
        let imageProcessor = ImageProcessor()
        
       castImages(photos: photos)
        
        let start = DispatchTime.now()
        
        
        imageProcessor.processImagesOnThread(sourceImages: images, filter: .chrome, qos: .userInitiated)  {
            images in
            
            
            DispatchQueue.main.async { [weak self] in
                for image in images {
                    guard let image = image else {return}
                    self?.newAlbum.append(UIImage(cgImage: image))
                    self?.photoCollection.reloadData()
                    
                }
            }
        }
        
        
            
        
       
        let finish = DispatchTime.now()
        let nanoTime = finish.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoTime) / 1_000_000_000
        print("TimeInterval = \(timeInterval)")
        photoCollection.reloadData()
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        newAlbum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.id, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        
        cell.imageView.image = newAlbum[indexPath.item]
        
        return cell
    }
}


