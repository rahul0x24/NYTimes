//
//  NYByline.m
//  NYTimes
//
//  Created by Rahul Katariya on 21/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

#import "NYByline.h"

@interface NYByline () <MTLJSONSerializing, MTLManagedObjectSerializing>

@end

@implementation NYByline

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

+(NSString *)managedObjectEntityName {
    return @"Byline";
}

+(NSDictionary *)managedObjectKeysByPropertyKey {
    return @{};
}

@end
