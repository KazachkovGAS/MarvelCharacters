//
//  ComicsItem.h
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <FastEasyMapping/FastEasyMapping.h>

@class Comics;

NS_ASSUME_NONNULL_BEGIN

@interface ComicsItem : NSManagedObject

+(FEMMapping *)defaultMapping;

@end

NS_ASSUME_NONNULL_END

#import "ComicsItem+CoreDataProperties.h"
