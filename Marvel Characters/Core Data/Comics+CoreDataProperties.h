//
//  Comics+CoreDataProperties.h
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Comics.h"

NS_ASSUME_NONNULL_BEGIN

@interface Comics (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *available;
@property (nullable, nonatomic, retain) NSString *collectionURI;
@property (nullable, nonatomic, retain) Character *comicsContext;
@property (nullable, nonatomic, retain) NSSet<ComicsItem *> *comicsItems;

@end

@interface Comics (CoreDataGeneratedAccessors)

- (void)addComicsItemsObject:(ComicsItem *)value;
- (void)removeComicsItemsObject:(ComicsItem *)value;
- (void)addComicsItems:(NSSet<ComicsItem *> *)values;
- (void)removeComicsItems:(NSSet<ComicsItem *> *)values;

@end

NS_ASSUME_NONNULL_END
