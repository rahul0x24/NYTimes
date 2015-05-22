//
//  NYMultimedia.h
//  NYTimes
//
//  Created by Rahul Katariya on 20/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

@import Mantle;

@interface NYMultimedia : MTLModel

@property (strong, nonatomic, readonly, nullable) NSString *type;
@property (strong, nonatomic, readonly, nullable) NSString *url;
@property (strong, nonatomic, readonly, nullable) NSString *supType;
@property (strong, nonatomic, readonly, nullable) NSString *caption;

@end
