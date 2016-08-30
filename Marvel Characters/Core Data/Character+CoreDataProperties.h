//
//  Character+CoreDataProperties.h
//  Marvel Characters
//
//  Created by Максим on 30.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Character.h"

NS_ASSUME_NONNULL_BEGIN

@interface Character (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *descriptionBio;
@property (nullable, nonatomic, retain) NSString *modified;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *resourceURI;
@property (nullable, nonatomic, retain) NSNumber *uid;
@property (nullable, nonatomic, retain) Comics *comics;
@property (nullable, nonatomic, retain) Events *events;
@property (nullable, nonatomic, retain) Thumbnail *image;
@property (nullable, nonatomic, retain) Series *series;
@property (nullable, nonatomic, retain) Stories *stories;
@property (nullable, nonatomic, retain) NSSet<Urls *> *url;

@end

@interface Character (CoreDataGeneratedAccessors)

- (void)addUrlObject:(Urls *)value;
- (void)removeUrlObject:(Urls *)value;
- (void)addUrl:(NSSet<Urls *> *)values;
- (void)removeUrl:(NSSet<Urls *> *)values;

@end

NS_ASSUME_NONNULL_END
