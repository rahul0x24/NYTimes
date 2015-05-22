//
//  NYByline.h
//  NYTimes
//
//  Created by Rahul Katariya on 21/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface NYByline : MTLModel

@property (strong, nonatomic, readonly, nullable) NSString *original;

@end
