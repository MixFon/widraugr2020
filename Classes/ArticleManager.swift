//
//  ArticleManager.swift
//  widraugr2020
//
//  Created by Михаил Фокин on 03.12.2020.
//

import Foundation
import CoreData

@available(iOS 10.0, *)
public class ArticleManager {

    public var managedObjectContext: NSManagedObjectContext
    
    let allLanguage = ["ENG", "RUS", "UKR", "USA"]
   
    public func newArticle() -> Article {
        let article = Article(context: managedObjectContext)
        article.content = String.randomString(length: 20)
        article.language = allLanguage[Int(arc4random_uniform(4))]
        article.title = String.randomString(length: 5)
        article.creation_date = Date()
        article.modification_date = Date()
        return article
    }
    
    public init() {
        // Создаем переменную для доступа к данным пакета
        let bundle = Bundle(for: Article.self)
        
        // Для инициализации managedObjectContext необходимо получить:
        // modelObject->PersistenStoreCoordinator->URL_на_базу данных->Связать
        
        // Инициализируем обьект managedObjectContext
        guard let modelURL = bundle.url(forResource: "article", withExtension: "momd") else {
            fatalError("Error bondle.url")
        }
        guard let managerObjectModel = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Initialization NSManagedObjectModel")
        }
        
        // Создаем PersistenStoreCoordinator на основе только что созданной модели.
        let presistenStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managerObjectModel)
        
        // Создаем ссылку на БД
        let storeUrl = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("article.sqlite")
        
        // Далее необходимо связвть PersistenStoreCoordinator c PersistentStore
        do{
            try presistenStoreCoordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeUrl, options: nil)
        } catch {
            fatalError("Error addPersistentStore")
        }
        // Инициализируем контекст и связваем его с созданным координатором
        // Запускаем в оидельной очереди
        managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = presistenStoreCoordinator
    }
    
        public func getAllArticles() -> [Article] {
            //let context = getContext()
            // Запрос на получение всех данных
            let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
            var objects: [Article] = []
            do {
                objects = try managedObjectContext.fetch(fetchRequest)
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            return objects
        }
    
//    public func getContext() -> NSManagedObjectContext{
//        let persistentContainer: NSPersistentContainer = {
//              let container = NSPersistentContainer(name: "article")
//              container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//                  if let error = error as NSError? {
//                      fatalError("Unresolved error \(error), \(error.userInfo)")
//                  }
//              })
//              return container
//          }()
//
//        let context: NSManagedObjectContext = {
//            return persistentContainer.viewContext
//          }()
//        return context
//    }


}

extension String {
    static func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

//public override init(){
//    let persistentContainer: NSPersistentContainer = {
//          let container = NSPersistentContainer(name: "Article")
//          container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//              if let error = error as NSError? {
//                  fatalError("Unresolved error \(error), \(error.userInfo)")
//              }
//          })
//          return container
//      }()
//    managedObjectContext = persistentContainer.viewContext
//    print("Hello")
//    print(managedObjectContext)
//
//}
