//
//  ArticleViewController.swift
//  NYTimes
//
//  Created by Rahul Katariya on 20/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

import UIKit

class ArticleViewController: UIViewController {
    
    var article: NYArticle!

    @IBOutlet weak var byline: UILabel!
    @IBOutlet weak var leadParagraph: UILabel!
    @IBOutlet weak var pubDate: UILabel!
    @IBOutlet weak var typeOfMaterial: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addGestureRecognizerToImageView() {
        var tapGR = UITapGestureRecognizer(target: self, action: "")
        imageView.addGestureRecognizer(tapGR);
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
