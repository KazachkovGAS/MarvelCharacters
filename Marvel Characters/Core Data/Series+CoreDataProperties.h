//
//  Series+CoreDataProperties.h
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Series.h"

NS_ASSUME_NONNULL_BEGIN

@interface Series (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *available;
@property (nullable, nonatomic, retain) NSString *collectionURI;
@property (nullable, nonatomic, retain) NSSet<SeriesItem *> *series;
@property (nullable, nonatomic, retain) Character *seriesContex;

@end

@interface Series (CoreDataGeneratedAccessors)

- (void)addSeriesObject:(SeriesItem *)value;
- (void)removeSeriesObject:(SeriesItem *)value;
- (void)addSeries:(NSSet<SeriesItem *> *)values;
- (void)removeSeries:(NSSet<SeriesItem *> *)values;

@end

NS_ASSUME_NONNULL_END
