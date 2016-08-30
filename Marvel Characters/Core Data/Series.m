//
//  Series.m
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "Series.h"
#import "Character.h"
#import "SeriesItem.h"

@implementation Series

+(FEMMapping *)defaultMapping{
    FEMMapping *mapping = [[FEMMapping alloc] initWithEntityName:@"Series"];
    [mapping addAttributesFromDictionary:@{@"available" : @"available",
                                           @"collectionURI" : @"collectionURI"}];
    [mapping addToManyRelationshipMapping:[SeriesItem defaultMapping] forProperty:@"seriesItems" keyPath:@"items"];
    return mapping;

}

@end
