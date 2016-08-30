//
//  Urls.m
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "Urls.h"
#import "Character.h"

@implementation Urls

+(FEMMapping *)defaultMapping{
    
    FEMMapping *mapping = [[FEMMapping alloc] initWithEntityName:@"Urls"];
    [mapping addAttributesFromDictionary:@{@"type" : @"type",
                                           @"url" : @"url"}];
    return mapping;
}

@end
