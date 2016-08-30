//
//  EventsItem.m
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "EventsItem.h"
#import "Events.h"

@implementation EventsItem

+(FEMMapping *)defaultMapping{
    
    FEMMapping *mapping = [[FEMMapping alloc] initWithEntityName:@"EventsItem"];
    [mapping addAttributesFromDictionary:@{@"resourceURI" : @"resourceURI",
                                           @"name" : @"name"}];
    return mapping;

}

@end
