//
//  AppDelegate+MOC.h
//  Marvel Characters
//
//  Created by Максим on 30.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (MOC)

-(void)saveContext:(NSManagedObjectContext *)managedObjectContext;

-(NSManagedObjectContext *)createMainQueueManagedObjectContext;

@end
