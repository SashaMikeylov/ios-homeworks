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
    
    private let activituIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activituIndicator.startAnimating()
        tuneCollection()
        tuneView()
        setUp()
        imageTune()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        
    }
    
    private  func castImages(photos: [Photo])  {
       
        for image in photos {
            let photo = UIImage(named: image.photoName) ?? UIImage()
            images.append(photo)
        }
    }
    
    private func tuneView(){
        view.backgroundColor = .white
        title = "Photo Gallery"
        view.addSubview(photoCollection)
        view.addSubview(activituIndicator)
    }
    
    private func tuneCollection(){
        photoCollection.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.id)
        photoCollection.dataSource = self
    }
    
    private func setUp(){
        
        activituIndicator.translatesAutoresizingMaskIntoConstraints = false
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            activituIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activituIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            photoCollection.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            photoCollection.leftAnchor.constraint(equalTo: safeAreaGuide.leftAnchor),
            photoCollection.rightAnchor.constraint(equalTo: safeAreaGuide.rightAnchor),
            photoCollection.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            
        ])
    }
    
    private func imageTune(){
        
        let imageProcessor = ImageProcessor()
        
       castImages(photos: photos)
        
        let timeStart = DispatchTime.now()
        
//MARK: userInitiated -  5.311028129 seconds
        
        imageProcessor.processImagesOnThread(sourceImages: images, filter: .chrome, qos: .userInitiated)  {
            images in


            DispatchQueue.main.async { [weak self] in
                for image in images {
                    guard let image = image else {return}
                    self?.newAlbum.append(UIImage(cgImage: image))
                    self?.activituIndicator.stopAnimating()
                    self?.photoCollection.reloadData()
                }
            }

            let timeEnd = DispatchTime.now()
            let timeInterval = Double(timeEnd.uptimeNanoseconds - timeStart.uptimeNanoseconds) / 1_000_000_000
            print ("Time interval: \(timeInterval) seconds")
        }

//MARK:  utility -  5.371492083 seconds
        
//        imageProcessor.processImagesOnThread(sourceImages: images, filter: .fade, qos: .utility)  {
//            images in
//
//
//            DispatchQueue.main.async { [weak self] in
//                for image in images {
//                    guard let image = image else {return}
//                    self?.newAlbum.append(UIImage(cgImage: image))
//                    self?.activituIndicator.stopAnimating()
//                    self?.photoCollection.reloadData()
//                }
//            }
//
//            let timeEnd = DispatchTime.now()
//            let timeInterval = Double(timeEnd.uptimeNanoseconds - timeStart.uptimeNanoseconds) / 1_000_000_000
//            print ("Time interval: \(timeInterval) seconds")
//        }
  
//MARK: background - 6.642483322 seconds
        
//        imageProcessor.processImagesOnThread(sourceImages: images, filter: .colorInvert, qos: .background)  {
//            images in
//
//
//            DispatchQueue.main.async { [weak self] in
//                for image in images {
//                    guard let image = image else {return}
//                    self?.newAlbum.append(UIImage(cgImage: image))
//                    self?.activituIndicator.stopAnimating()
//                    self?.photoCollection.reloadData()
//                }
//            }
//
//            let timeEnd = DispatchTime.now()
//            let timeInterval = Double(timeEnd.uptimeNanoseconds - timeStart.uptimeNanoseconds) / 1_000_000_000
//            print ("Time interval: \(timeInterval) seconds")
//        }
        
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


