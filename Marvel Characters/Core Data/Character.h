//
//  Character.h
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comics, Events, Series, Stories, Thumbnail, Urls;

NS_ASSUME_NONNULL_BEGIN

@interface Character : NSManagedObject

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "Character+CoreDataProperties.h"
