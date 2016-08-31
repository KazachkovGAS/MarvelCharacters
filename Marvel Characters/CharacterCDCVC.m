//
//  CharacterCDCVC.m
//  Marvel Characters
//
//  Created by Максим on 30.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "CharacterCDCVC.h"
#import "Character.h"
#import "CharacterCDCVCC.h"
#import "AppDelegate.h"
#import "TMCharactersRequestManager.h"
#import "CharacterCDCVL.h"

@interface CharacterCDCVC()

@property (nonatomic, strong) TMCharactersRequestManager *charactersRequestManager;
@property (nonatomic, strong) NSArray *characters;

@end

@implementation CharacterCDCVC

-(TMCharactersRequestManager *)charactersRequestManager{
    if (!_charactersRequestManager) {
        _charactersRequestManager = [[TMCharactersRequestManager alloc] init];
    }
    return _charactersRequestManager;
}

//- (NSArray *)characters{
//    
//    return _characters;
//}

- (void)viewDidLoad{
    [super viewDidLoad];
    [self.charactersRequestManager getCharactersWithCompletion:^(NSArray *characters, NSError *error) {
        if (!error){
            self.characters = characters;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.collectionView reloadData];
            });
            
        } else {
            NSLog(@"No characters available");
        }
    }];
    //  [self.collectionView flowLayout];
    
    
    // with Core Data
    //    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    //    self.managedObjectContext = delegate.managedObjectContext;
}

/*
-(void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext{
    _managedObjectContext = managedObjectContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Character"];
    request.predicate = nil;
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                              ascending:YES
                                                               selector:@selector(localizedStandardCompare:)]];
    request.fetchLimit = 20;
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:managedObjectContext
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.characters count];
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Character Cell"
                                                                                forIndexPath:indexPath];
    
    Character *character = (Character *) [self.characters objectAtIndex:indexPath.item];
    
    CharacterCDCVCC *loadData = (CharacterCDCVCC *)cell;
    
    loadData.character = character;
    [loadData updateUI];
    
    return cell;
}







@end
