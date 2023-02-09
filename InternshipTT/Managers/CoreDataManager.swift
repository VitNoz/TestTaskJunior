//
//  CoreDataManager.swift
//  InternshipTT
//
//  Created by Vitalik Nozhenko on 02.02.2023.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    private let context: NSManagedObjectContext
    
    private init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
    }
    
    func fecthData() -> [FavoriteArticle] {
        
        do {
            let request: NSFetchRequest<FavoriteArticle> = FavoriteArticle.fetchRequest()
            let favoriteArticle = try context.fetch(request)
            return favoriteArticle
        }
        catch let error as NSError {
            print(error.localizedDescription)
            return []
        }
    }
    
    func saveData(title: String, abstract: String, publishedDate: String, byline: String, image: Data?) {
        
        let entity = NSEntityDescription.entity(forEntityName: "FavoriteArticle", in: context)
        let favoriteArticle = FavoriteArticle(entity: entity!, insertInto: context)
        favoriteArticle.title = title
        favoriteArticle.abstract = abstract
        favoriteArticle.publishedDate = publishedDate
        favoriteArticle.byline = byline
        favoriteArticle.image = image
        do {
            try context.save()
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
    
    func deleteData(object: FavoriteArticle) {

        do {
            context.delete(object)
            try context.save()
        }
        catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
