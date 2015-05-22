//
//  NYArticleResponse.m
//  NYTimes
//
//  Created by Rahul Katariya on 20/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

#import "NYArticleResponse.h"
#import "NYArticle.h"

@interface NYArticleResponse ()

@end

@implementation NYArticleResponse

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"docs": @"response.docs",
             @"status": @"response.status"
             };
}

+ (NSValueTransformer *)docsJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[NYArticle class]];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
                                                                           @"OK": @(NYResponseStatusSuccess)
                                                                           } defaultValue:@(NYResponseStatusFailure) reverseDefaultValue:nil];
}

@end
