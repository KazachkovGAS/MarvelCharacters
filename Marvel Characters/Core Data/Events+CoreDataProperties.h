//
//  Events+CoreDataProperties.h
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Events.h"

NS_ASSUME_NONNULL_BEGIN

@interface Events (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *available;
@property (nullable, nonatomic, retain) NSString *collectionURI;
@property (nullable, nonatomic, retain) Character *eventsContext;
@property (nullable, nonatomic, retain) NSSet<EventsItem *> *eventsItems;

@end

@interface Events (CoreDataGeneratedAccessors)

- (void)addEventsItemsObject:(EventsItem *)value;
- (void)removeEventsItemsObject:(EventsItem *)value;
- (void)addEventsItems:(NSSet<EventsItem *> *)values;
- (void)removeEventsItems:(NSSet<EventsItem *> *)values;

@end

NS_ASSUME_NONNULL_END
