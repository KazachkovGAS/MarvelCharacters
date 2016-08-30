//
//  EventsItem.h
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <FastEasyMapping/FastEasyMapping.h>

@class Events;

NS_ASSUME_NONNULL_BEGIN

@interface EventsItem : NSManagedObject

+(FEMMapping *)defaultMapping;

@end

NS_ASSUME_NONNULL_END

#import "EventsItem+CoreDataProperties.h"
