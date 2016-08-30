//
//  Thumbnail.m
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "Thumbnail.h"
#import "Character.h"


@implementation Thumbnail

+(FEMMapping *)defaultMapping {
  
    FEMMapping *mapping = [[FEMMapping alloc] initWithEntityName:@"Thumbnail"];
    [mapping addAttributesFromDictionary:@{@"path" : @"path",
                                           @"extension" : @"extension"}];
    
    
    return mapping;
  
}
@end
