//
//  NYHeadline.m
//  NYTimes
//
//  Created by Rahul Katariya on 22/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

#import "NYHeadline.h"

@interface NYHeadline () <MTLJSONSerializing, MTLManagedObjectSerializing>

@end

@implementation NYHeadline


+(NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{};
}

+(NSString *)managedObjectEntityName {
    return @"Headline";
}

+(NSDictionary *)managedObjectKeysByPropertyKey {
    return @{};
}

@end
