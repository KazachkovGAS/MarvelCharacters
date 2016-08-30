//
//  CoreDataCollectionViewController.h
//  Marvel Characters
//
//  Created by Максим on 30.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface CoreDataCollectionViewController : UICollectionViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

// Заставляет fetchedResultsController обновлять данные.
// NSFetchedResultsController класс отслеживает context

// Это также будет автоматически вызываться, если изменили fetchedResultsController @property.
- (void)performFetch;

// Установите в YES для получения дополнительной информации на консоле при отладке.
@property BOOL debug;


@end
