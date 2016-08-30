//
//  SeriesItem.m
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "SeriesItem.h"
#import "Series.h"

@implementation SeriesItem

+(FEMMapping *)defaultMapping{
    FEMMapping *mapping = [[FEMMapping alloc] initWithEntityName:@"SeriesItem"];
    [mapping addAttributesFromDictionary:@{@"resourceURI" : @"resourceURI",
                                           @"name" : @"name"}];
    return mapping;
}

@end
