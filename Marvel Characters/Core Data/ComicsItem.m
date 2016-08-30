//
//  ComicsItem.m
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "ComicsItem.h"
#import "Comics.h"

@implementation ComicsItem

+(FEMMapping *)defaultMapping{
    FEMMapping *mapping = [[FEMMapping alloc] initWithEntityName:@"ComicsItem"];
    [mapping addAttributesFromDictionary:@{@"resourceURI" : @"resourceURI",
                                           @"name" : @"name"}];
    return mapping;
}

@end
