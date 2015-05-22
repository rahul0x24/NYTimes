//
//  CoreDataAPISyncController.swift
//  NYTimes
//
//  Created by Rahul Katariya on 21/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

import Foundation
import ReactiveCocoa

class CoreDataAPISyncController {
    
    static var applicationDocumentsDirectory: NSURL = {
        // The directory the application uses to store the Core Data store file. This code uses a directory named "com.rahulkatariya.NYTimes" in the application's documents Application Support directory.
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[urls.count-1] as! NSURL
        }()
    
    static var managedObjectModel: NSManagedObjectModel = {
        // The managed object model for the application. This property is not optional. It is a fatal error for the application not to be able to find and load its model.
        let modelURL = NSBundle.mainBundle().URLForResource("NYTimes", withExtension: "momd")!
        return NSManagedObjectModel(contentsOfURL: modelURL)!
        }()
    
    static var url = applicationDocumentsDirectory.URLByAppendingPathComponent("NYTimes.sqlite")
    static var persistenceController = MDMPersistenceController(storeURL: url, model: managedObjectModel)
    
    class func syncArticles() {
        NYSerivceApi.articles()
            |> start(next: { articles in
                if let articles = articles as? [NYArticle] {
                    let moc = self.persistenceController.newChildManagedObjectContext()
                    for article in articles {
                        MTLManagedObjectAdapter.managedObjectFromModel(article, insertingIntoContext: moc, error: nil)                    }
                    if moc.save(nil) {
                        self.persistenceController.saveContextAndWait(true, completion: { (error) -> Void in
                            println("Save Completed with Error : \(error)")
                        })
                    }
                }
            }, error: {
                println("Error \($0)")
        })
    }
   
}
