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

@interface NYArticle : MTLModel <MTLJSONSerializing, MTLManagedObjectSerializing>

@property (strong, nonatomic, readonly, nullable) NSURL *webURL;
@property (strong, nonatomic, readonly, nullable) NSString *leadParagraph;
@property (strong, nonatomic, readonly, nullable) NSSet *multimedia;
@property (strong, nonatomic, readonly, nullable) NYByline *byline;
@property (strong, nonatomic, readonly, nullable) NYHeadline *headline;
@property (strong, nonatomic, readonly, nullable) NSString *typeOfMaterial;
@property (strong, nonatomic, readonly, nullable) NSString *articleId;
@property (strong, nonatomic, readonly, nullable) NSString *pubDate;

@end
