//
//  ArticleManager.swift
//  widraugr2020
//
//  Created by Михаил Фокин on 03.12.2020.
//

import Foundation
import CoreData

@available(iOS 10.0, *)
class ArticleManager {
    
    let allLanguage = ["ENG", "RUS", "UKR", "USA"]
    
    func newArticle() -> Article {
        let article = Article()
        article.content = String.randomString(length: 20)
        article.language = allLanguage[Int(arc4random_uniform(4))]
        article.title = String.randomString(length: 5)
        article.creation_date = Date()
        article.modification_date = Date()
        return article
    }
    
    func getContext() -> NSManagedObjectContext{
        let persistentContainer: NSPersistentContainer = {
              let container = NSPersistentContainer(name: "SavingLearn")
              container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                  if let error = error as NSError? {
                      fatalError("Unresolved error \(error), \(error.userInfo)")
                  }
              })
              return container
          }()
        
        let context: NSManagedObjectContext = {
            return persistentContainer.viewContext
          }()
        return context
    }
    
    func getAllArticles() -> [Article] {
        let context = getContext()
        // Запрос на получение всех данных
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        var objects: [Article] = []
        do {
            objects = try context.fetch(fetchRequest)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return objects
    }
    
}

extension String {
    static func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
