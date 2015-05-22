//
//  NYArticle.m
//  NYTimes
//
//  Created by Rahul Katariya on 20/05/15.
//  Copyright (c) 2015 Rahul Katariya. All rights reserved.
//

#import "NYArticle.h"

@interface NYArticle ()

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

+ (NSValueTransformer *)headlineJSONTransformer
{
    return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[NYHeadline class]];
}

#pragma mark - MTLManagedObjectSerializing

+ (NSString *)managedObjectEntityName {
    return @"Article";
}

+ (NSDictionary *)managedObjectKeysByPropertyKey {
    return @{};
}

+ (NSValueTransformer *)webURLEntityAttributeTransformer {
    return [[NSValueTransformer valueTransformerForName:MTLURLValueTransformerName] mtl_invertedTransformer];
}

+ (NSDictionary *)relationshipModelClassesByPropertyKey {
    return @{
             @"byline" : [NYByline class],
             @"headline" : [NYHeadline class],
             @"multimedia" : [NYMultimedia class]
             };
}

+ (NSSet *)propertyKeysForManagedObjectUniquing {
    return [NSSet setWithObjects:@"articleId", nil];
}

@end
