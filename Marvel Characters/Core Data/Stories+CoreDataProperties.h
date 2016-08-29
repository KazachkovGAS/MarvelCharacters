//
//  Stories+CoreDataProperties.h
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Stories.h"

NS_ASSUME_NONNULL_BEGIN

@interface Stories (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *available;
@property (nullable, nonatomic, retain) NSString *collectionURI;
@property (nullable, nonatomic, retain) Character *storiesContext;
@property (nullable, nonatomic, retain) NSSet<StoriesItem *> *storiesItems;

@end

@interface Stories (CoreDataGeneratedAccessors)

- (void)addStoriesItemsObject:(StoriesItem *)value;
- (void)removeStoriesItemsObject:(StoriesItem *)value;
- (void)addStoriesItems:(NSSet<StoriesItem *> *)values;
- (void)removeStoriesItems:(NSSet<StoriesItem *> *)values;

@end

NS_ASSUME_NONNULL_END
