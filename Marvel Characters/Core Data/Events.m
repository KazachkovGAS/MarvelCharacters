//
//  Events.m
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "Events.h"
#import "Character.h"
#import "EventsItem.h"

@implementation Events

+(FEMMapping *)defaultMapping{
    FEMMapping *mapping = [[FEMMapping alloc] initWithEntityName:@"Events"];
    [mapping addAttributesFromDictionary:@{@"available" : @"available",
                                           @"collectionURI" : @"collectionURI"}];
    [mapping addToManyRelationshipMapping:[EventsItem defaultMapping] forProperty:@"eventsItems" keyPath:@"items"];
    return mapping;
}

@end
