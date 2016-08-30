//
//  Comics.m
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "Comics.h"
#import "Character.h"
#import "ComicsItem.h"

@implementation Comics

+(FEMMapping *)defaultMapping{
    
    FEMMapping *mapping = [[FEMMapping alloc] initWithEntityName:@"Comics"];
    [mapping addAttributesFromDictionary:@{@"available" : @"available",
                                           @"collectionURI" : @"collectionURI"}];
    [mapping addToManyRelationshipMapping:[ComicsItem defaultMapping] forProperty:@"comicsItems" keyPath:@"items"];
   
    return mapping;
}
@end
