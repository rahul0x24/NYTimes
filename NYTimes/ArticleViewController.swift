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

    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var byline: UILabel!
    @IBOutlet weak var leadParagraph: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = article.typeOfMaterial
        articleTitle.text = article.headline?.main
        byline.text = article.byline?.original
        leadParagraph.text = article.leadParagraph
        
        if let multimedia = article.multimedia as? Set<NYMultimedia> {
            for m in multimedia {
                if m.type == "image" && m.subtype?.rangeOfString("large") != nil {
                    imageView.sd_setImageWithURL(NSURL(string: "http://static01.nyt.com/"+m.url!))
                    break
                }
            }
        }
        
        addGestureRecognizerToImageView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addGestureRecognizerToImageView() {
        var tapGR = UITapGestureRecognizer(target: self, action: "showImage")
        imageView.userInteractionEnabled = true
        imageView.addGestureRecognizer(tapGR);
        
    }
    
    func showImage() {
        performSegueWithIdentifier("ShowArticleImageViewController", sender: self.imageView.image)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowArticleWebViewController" {
            let dvc = segue.destinationViewController as? ArticleWebViewController
            dvc!.title = article.headline?.main
            dvc!.webURL = article.webURL
        } else if segue.identifier == "ShowArticleImageViewController" {
            let dvc = segue.destinationViewController as? ArticleImageViewController
            dvc!.title = article.headline?.main
            dvc?.image = sender as? UIImage
            dvc!.transitioningDelegate = self
        }
    }
}

extension ArticleViewController : UIViewControllerTransitioningDelegate {
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ArticleImageAnimator(imageView: imageView)
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return ArticleImageAnimator(imageView: imageView)
    }
    
}
