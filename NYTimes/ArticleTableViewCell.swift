//
//  ArticleTableViewCell.swift
//  NYTimes
//
//  Created by Rahul Katariya on 21/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

import UIKit
import ReactiveCocoa
import RandomColorSwift

class ArticleTableViewCell: UITableViewCell {
    
    var article: NYArticle! {
        didSet {
            if let multimedia = article.multimedia as? Set<NYMultimedia> {
                for m in multimedia {
                    if m.type == "image" && m.subtype?.rangeOfString("large") != nil {
                        articleImageView.sd_setImageWithURL(NSURL(string: "http://static01.nyt.com/"+m.url!), placeholderImage: nil)
                        break
                    }
                }
            }
            headlineLabel.text = article.headline?.main
            pubDateLabel.text = article.pubDate
            typeOfMaterialLabel.text = article.typeOfMaterial?.uppercaseString
            leadParagraphLabel.text = article.leadParagraph
            bylineLabel.text = article.byline?.original
        }
    }

    @IBOutlet weak var blurView: UIView!
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var typeOfMaterialLabel: UILabel!
    @IBOutlet weak var leadParagraphLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let rc = randomColor(hue: .Random, luminosity: .Dark)
        blurView.backgroundColor = rc.colorWithAlphaComponent(0.5)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
