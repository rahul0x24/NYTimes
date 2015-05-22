//
//  NYArticle.m
//  NYTimes
//
//  Created by Rahul Katariya on 20/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

#import "NYArticle.h"
#import "NYMultimedia.h"
#import "NYByline.h"

@interface NYArticle () <MTLJSONSerializing, MTLManagedObjectSerializing>

@end

@implementation NYArticle

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"webURL": @"web_url",
             @"leadParagraph": @"lead_paragraph",
             @"typeOfMaterial": @"type_of_material",
             @"articleId": @"_id",
             @"pubDate": @"pub_date"
             };
}

+ (NSValueTransformer *)webURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)multimediaJSONTransformer
{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[NYMultimedia class]];
}

+ (NSValueTransformer *)bylineJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[NYByline class]];
}

#pragma mark - MTLManagedObjectSerializing
+ (NSString *)managedObjectEntityName {
    return @"Article";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return @{
             @"multimedia": [NSNull null],
             @"byline": [NSNull null]
             };
}

+ (NSValueTransformer *)webURLEntityAttributeTransformer {
    return [[NSValueTransformer valueTransformerForName:MTLURLValueTransformerName] mtl_invertedTransformer];
}

+ (NSValueTransformer *)multimediaEntityAttributeTransformer {
    return [[NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[NYMultimedia class]] mtl_invertedTransformer];
}

+ (NSSet *)propertyKeysForManagedObjectUniquing {
    return [NSSet setWithObjects:@"articleId", nil];
}

@end
