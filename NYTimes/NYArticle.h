//
//  NYArticle.h
//  NYTimes
//
//  Created by Rahul Katariya on 20/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

@import Mantle;

@class NYByline;

@interface NYArticle : MTLModel

@property (strong, nonatomic, readonly) NSURL *webURL;
@property (strong, nonatomic, readonly) NSString *leadParagraph;
@property (strong, nonatomic, readonly) NSArray *multimedia;
@property (strong, nonatomic, readonly) NYByline *byline;
@property (strong, nonatomic, readonly) NSString *typeOfMaterial;
@property (strong, nonatomic, readonly) NSString *articleId;
@property (strong, nonatomic, readonly) NSString *pubDate;

@end
