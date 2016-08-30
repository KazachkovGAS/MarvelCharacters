//
//  Stories.m
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "Stories.h"
#import "Character.h"
#import "StoriesItem.h"

@implementation Stories

+(FEMMapping *)defaultMapping{
    
    FEMMapping *mapping = [[FEMMapping alloc] initWithEntityName:@"Stories"];
    [mapping addAttributesFromDictionary:@{@"available" : @"available",
                                           @"collectionURI" : @"collectionURI"}];
    [mapping addToManyRelationshipMapping:[StoriesItem defaultMapping] forProperty:@"storiesItems" keyPath:@"items"];

    return mapping;
}

@end
