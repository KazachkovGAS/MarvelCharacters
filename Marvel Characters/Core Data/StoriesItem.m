//
//  StoriesItem.m
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "StoriesItem.h"
#import "Stories.h"

@implementation StoriesItem

+(FEMMapping *)defaultMapping{
    FEMMapping *mapping = [[FEMMapping alloc] initWithEntityName:@"StoriesItem"];
    [mapping addAttributesFromDictionary:@{@"resourceURI" : @"resourceURI",
                                           @"name" : @"name",
                                           @"type" : @"type"}];
    return mapping;

}

@end
