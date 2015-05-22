//
//  ArticlesTableViewController.swift
//  NYTimes
//
//  Created by Rahul Katariya on 20/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

import UIKit

class ArticlesTableViewController: UITableViewController {
    
    lazy var fetchedResultsController: NSFetchedResultsController = {
        let fetchRequest = NSFetchRequest(entityName: "Article")
        let sortDescritor = NSSortDescriptor(key: "pubDate", ascending: false)
        fetchRequest.sortDescriptors = [sortDescritor]
        let frc = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: CoreDataAPISyncController.persistenceController.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        frc.delegate = self
        return frc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        title = "Articles"
        
        CoreDataAPISyncController.syncArticles()
        
        var error: NSError? = nil
        if (fetchedResultsController.performFetch(&error) == false) {
            print("An error occurred: \(error?.localizedDescription)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowArticleWebViewController" {
            let indexPath = self.tableView.indexPathForSelectedRow()
            let mob = fetchedResultsController.objectAtIndexPath(indexPath!) as! NSManagedObject
            let article = MTLManagedObjectAdapter.modelOfClass(NYArticle.self, fromManagedObject: mob, error: nil) as! NYArticle
            let dvc = segue.destinationViewController as? ArticleWebViewController
            dvc!.title = article.headline?.main
            dvc!.webURL = article.webURL
        }
        
    }


}

extension ArticlesTableViewController : UITableViewDataSource {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        if let sections = fetchedResultsController.sections {
            let currentSection = sections[section] as! NSFetchedResultsSectionInfo
            return currentSection.numberOfObjects
        }
        return 0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("articleCell", forIndexPath: indexPath) as! ArticleTableViewCell
        
        // Configure the cell...
        let mob = fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
        
        configureCell(cell, withObject: mob)
        
        return cell
    }
    
    func configureCell(cell: UITableViewCell, withObject object: NSManagedObject) {
        if let cell = cell as? ArticleTableViewCell {
            let article = MTLManagedObjectAdapter.modelOfClass(NYArticle.self, fromManagedObject: object, error: nil) as! NYArticle
            cell.articleImageView.image = nil
            cell.article = article
        }
    }
}

extension ArticlesTableViewController : NSFetchedResultsControllerDelegate {
    
    func controllerWillChangeContent(controller: NSFetchedResultsController) {
        tableView.beginUpdates()
    }
    
    func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
        switch(type) {
            
        case .Insert:
            if let newIndexPath = newIndexPath {
                tableView.insertRowsAtIndexPaths([newIndexPath],
                    withRowAnimation:UITableViewRowAnimation.Fade)
            }
            
        case .Delete:
            if let indexPath = indexPath {
                tableView.deleteRowsAtIndexPaths([indexPath],
                    withRowAnimation: UITableViewRowAnimation.Fade)
            }
            
        case .Update:
            if let indexPath = indexPath {
                if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                    if let mob = anObject as? NSManagedObject {
                        configureCell(cell, withObject: mob)
                    }
                }
            }
            
        case .Move:
            if let indexPath = indexPath {
                if let newIndexPath = newIndexPath {
                    tableView.deleteRowsAtIndexPaths([indexPath],
                        withRowAnimation: UITableViewRowAnimation.Fade)
                    tableView.insertRowsAtIndexPaths([newIndexPath],
                        withRowAnimation: UITableViewRowAnimation.Fade)
                }
            }
        }
    }
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.endUpdates()
    }
    
}
