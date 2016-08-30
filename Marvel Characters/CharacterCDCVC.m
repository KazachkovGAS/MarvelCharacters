//
//  CharacterCDCVC.m
//  Marvel Characters
//
//  Created by Максим on 30.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "CharacterCDCVC.h"
#import "Character.h"

@interface CharacterCDCVC ()
@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;
@property (weak, nonatomic) IBOutlet UILabel *characterName;

@end

@implementation CharacterCDCVC

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

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Character Cell"
                                                                                forIndexPath:indexPath];
    
    Character * character = [self.fetchedResultsController  objectAtIndexPath:indexPath];
    
    self.characterName.text = character.name;
    //self.characterImageView.image
    return cell;
}







@end
