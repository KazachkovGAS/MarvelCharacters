//
//  SeriesItem+CoreDataProperties.h
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "SeriesItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface SeriesItem (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *resourceURI;
@property (nullable, nonatomic, retain) Series *seriesItem;

@end

NS_ASSUME_NONNULL_END
