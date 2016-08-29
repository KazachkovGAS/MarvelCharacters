//
//  Urls+CoreDataProperties.h
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Urls.h"

NS_ASSUME_NONNULL_BEGIN

@interface Urls (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *type;
@property (nullable, nonatomic, retain) NSString *url;
@property (nullable, nonatomic, retain) Character *urls;

@end

NS_ASSUME_NONNULL_END
