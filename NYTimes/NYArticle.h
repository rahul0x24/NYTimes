//
//  NYArticle.h
//  NYTimes
//
//  Created by Rahul Katariya on 20/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

@import Mantle;

#import "NYByline.h"
#import "NYHeadline.h"
#import "NYMultimedia.h"

@interface NYArticle : MTLModel

@property (strong, nonatomic, readonly, nullable) NSURL *webURL;
@property (strong, nonatomic, readonly, nullable) NSString *leadParagraph;
@property (strong, nonatomic, readonly, nullable) NSArray *multimedia;
@property (strong, nonatomic, readonly, nullable) NSString *byline;
@property (strong, nonatomic, nullable) NYHeadline *headline;
@property (strong, nonatomic, readonly, nullable) NSString *typeOfMaterial;
@property (strong, nonatomic, readonly, nullable) NSString *articleId;
@property (strong, nonatomic, readonly, nullable) NSString *pubDate;

@end
