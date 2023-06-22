//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Денис Кузьминов on 22.06.2023.
//

import Foundation
import UIKit

class PhotosViewController: UIViewController {
    
    let photos = Photos.make()
    
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
}

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.id, for: indexPath) as? PhotoCell else { return UICollectionViewCell() }
        
        cell.imageView.image = UIImage(named: photos[indexPath.item].photoName)
        
        return cell
    }
}

extension PhotosViewController: UICollectionViewDelegate {

}
