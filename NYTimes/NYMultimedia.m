//
//  NYMultimedia.m
//  NYTimes
//
//  Created by Rahul Katariya on 20/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

#import "NYMultimedia.h"

@interface NYMultimedia () <MTLJSONSerializing, MTLManagedObjectSerializing>

@end

@implementation NYMultimedia

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

+ (NSString *)managedObjectEntityName {
    return @"Multimedia";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return @{};
}

@end
