//
//  CoreDataService.swift
//  Navigation
//
//  Created by Денис Кузьминов on 28.10.2023.
//

import UIKit
import CoreData
import StorageService


//final class CoreDataService: NSObject {
//    public static let shared = CoreDataService()
//    private override init() {}
//    
//    private var appDelegate: AppDelegate {
//        UIApplication.shared.delegate as! AppDelegate
//    }
//    
//    private var context: NSManagedObjectContext {
//        appDelegate.persistentContainer.viewContext
//    }
//    
//    public func savePost(_ post: Post) {
//        guard let postEnityDescription = NSEntityDescription.entity(forEntityName: "PostDataModel", in: context) else {return}
//        let dataPost = PostDataModel(entity: postEnityDescription, insertInto: context)
//        
//        dataPost.author = post.author
//        dataPost.image = post.image
//        dataPost.descrip = post.descrip
//        dataPost.likes = post.likes
//        dataPost.views = post.views
//        
//        appDelegate.saveContext()
//    }
//    
//    public func fetchPosts() -> [Post] {
//        let fetchRequest = PostDataModel.fetchRequest()
//       
//        do {
//            let posts = try context.fetch(fetchRequest)
//            return posts.map {Post(postCoreDataModel: $0)}
//        } catch {
//            print(error.localizedDescription)
//            return []
//        }
//    }
//    
//    public func deletePosts() {
//        let fetchRequest = PostDataModel.fetchRequest()
//        
//        do {
//            var posts = try context.fetch(fetchRequest)
//            posts.forEach {
//                context.delete($0)
//            }
//            
//            appDelegate.saveContext()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
    
        
    
//}


//
//// MARK: - CoreDataProtocol
//
//protocol CoreDataProtocol {
//    func savePost(post: Post)
//    func fetchPosts() -> [Post]
//    func deletePost()
//}
//
////MARK: - CoreDataService
//
//final class CoreDataService: CoreDataProtocol {
//   
//    private let modelName: String
//    private let objectModel: NSManagedObjectModel
//    private let storeCoordinator: NSPersistentStoreCoordinator
//    
//    private lazy var mainContext: NSManagedObjectContext = {
//        let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
//        return context
//    }()
//    
//    static let shared = CoreDataService()
//    
//    //MARK: - Initialize
//    
//    init() {
//        // 1 - NSManagedObjectModel
//        guard let url = Bundle.main.url(forResource: "Navigation", withExtension: "momd") else {
//            fatalError()
//        }
//        
//        let path = url.pathExtension
//        let name = url.lastPathComponent
//        
//        self.modelName = name
//        
//        guard let model = NSManagedObjectModel(contentsOf: url) else {
//            fatalError()
//        }
//        
//        self.objectModel = model
//        
//        //2 - NSStoreCoordinator
//        storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: objectModel)
//        
//        //3 - NSPersistenStore
//        let storeName = name + "sqlite"
//        let documentaryUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
//        let persistenStoreUrl = documentaryUrl?.appendingPathComponent(storeName)
//        
//        print("✅", persistenStoreUrl)
//        
//        guard let persistenStoreUrl else {return}
//        
//        do {
//            try storeCoordinator.addPersistentStore(
//                type: .sqlite,
//                at: persistenStoreUrl,
//                options: [NSMigratePersistentStoresAutomaticallyOption: true])
//        } catch {
//            fatalError()
//        }
//    }
//    
//    //MARK: - Save posts
//    
//    func savePost(post: Post) {
//        let model = PostDataModel(context: mainContext)
//        
//        model.author = post.author
//        model.descrip = post.descrip
//        model.image = post.image
//        model.likes = post.likes
//        model.views = post.views
//        
//        guard mainContext.hasChanges else {return print("Not changes") }
//        
//        do {
//            try mainContext.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//    
//    //MARK: - Fetch posts
//    
//    func fetchPosts() -> [Post] {
//        let request = PostDataModel.fetchRequest()
//        
//        do {
//            let modeles = try mainContext.fetch(request)
//            return modeles.map {
//                Post(postCoreDataModel: $0)
//            }
//        } catch {
//            return []
//        }
//    }
//    
//    //MARK: - Delete post
//    
//    func deletePost() {
//        let request = PostDataModel.fetchRequest()
//        
//        do {
//            let modeles = try mainContext.fetch(request)
//            
//            modeles.forEach {
//                mainContext.delete($0)
//            }
//            
//            guard mainContext.hasChanges else {return print("Not changes")}
//            try mainContext.save()
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//}
