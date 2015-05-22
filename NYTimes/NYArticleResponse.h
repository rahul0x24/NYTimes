//
//  NYArticleResponse.h
//  NYTimes
//
//  Created by Rahul Katariya on 20/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

@import Mantle;

typedef enum : NSUInteger {
    NYResponseStatusSuccess,
    NYResponseStatusFailure
} NYResponseStatus;

@interface NYArticleResponse : MTLModel

@property (strong, nonatomic, readonly) NSArray *docs;
@property (nonatomic, readonly) NYResponseStatus status;

@end
