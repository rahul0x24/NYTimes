//
//  ArticleTableViewCell.swift
//  NYTimes
//
//  Created by Rahul Katariya on 21/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ArticleTableViewCell: UITableViewCell {
    
    var article: NYArticle! {
        didSet {
            headlineLabel.text = article.headline?.main
            pubDateLabel.text = article.pubDate
            typeOfMaterialLabel.text = article.typeOfMaterial
            leadParagraphLabel.text = article.leadParagraph
            bylineLabel.text = article.byline
        }
    }

    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var headlineLabel: UILabel!
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var typeOfMaterialLabel: UILabel!
    @IBOutlet weak var leadParagraphLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
