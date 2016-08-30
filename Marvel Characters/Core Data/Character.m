//
//  Character.m
//  Marvel Characters
//
//  Created by Максим on 30.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "Character.h"
#import "Comics.h"
#import "Events.h"
#import "Series.h"
#import "Stories.h"
#import "Thumbnail.h"
#import "Urls.h"
#import <FastEasyMapping/FastEasyMapping.h>

@implementation Character

+(FEMMapping *)defaultMaping{
    
    FEMMapping *mapping = [[FEMMapping alloc] initWithEntityName:@"Character"];
    mapping.primaryKey = @"uid";
    [mapping addAttributesFromDictionary:@{@"uid" : @"id"}];
    [mapping addAttributesFromDictionary:@{@"name" : @"name"}];
    [mapping addAttributesFromDictionary:@{@"descriptionBio" : @"description"}];
    [mapping addAttributesFromDictionary:@{@"modified" : @"modified"}];
    [mapping addAttributesFromDictionary:@{@"resourceURI" : @"resourceURI"}];
    
    [mapping addRelationshipMapping:[Thumbnail defaultMapping] forProperty:@"image" keyPath:@"thumbnail"];
    [mapping addRelationshipMapping:[Comics defaultMapping] forProperty:@"comics" keyPath:@"comics"];
    [mapping addRelationshipMapping:[Events defaultMapping] forProperty:@"events" keyPath:@"events"];
    [mapping addRelationshipMapping:[Stories defaultMapping] forProperty:@"stories" keyPath:@"stories"];
    [mapping addRelationshipMapping:[Series defaultMapping] forProperty:@"series" keyPath:@"series"];

    
    [mapping addToManyRelationshipMapping:[Urls defaultMapping] forProperty:@"url" keyPath:@"urls"];

    return mapping;
}

+(NSArray *)addNewData:(NSArray *)data inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext{
    
    FEMMapping *mapping = [Character defaultMaping];
    return [FEMDeserializer collectionFromRepresentation:data mapping:mapping context:managedObjectContext];
}

@end
