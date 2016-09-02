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
#import "DetailCharacterInformation.h"

@interface CharacterCDCVC() <UICollectionViewDelegate>

@property (nonatomic, strong) TMCharactersRequestManager *charactersRequestManager;
@property (nonatomic, strong) NSArray *characters;

@end

@implementation CharacterCDCVC

static CGFloat leftAndRightPadding = 32.0;
static CGFloat numberOfItemsPerRow = 3.0;
static CGFloat heightAdjustment = 30.0;


- (TMCharactersRequestManager *)charactersRequestManager{
    if (!_charactersRequestManager) {
        _charactersRequestManager = [[TMCharactersRequestManager alloc] init];
    }
    return _charactersRequestManager;
}

- (void)viewDidLoad{
    [super viewDidLoad];
    CGFloat width = ( CGRectGetWidth(self.collectionView.frame) - leftAndRightPadding ) / numberOfItemsPerRow ;
    UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *) self.collectionViewLayout;
    [layout setItemSize:CGSizeMake(width, width + heightAdjustment)];
    
   
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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    Character *character = (Character *) [self.characters objectAtIndex:indexPath.item];
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    DetailCharacterInformation *detailCharacterInformation = [sb instantiateViewControllerWithIdentifier:@"Detail Character Information"];
    detailCharacterInformation.character = character;
    [self.navigationController pushViewController:detailCharacterInformation animated:YES];
}

//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtPath:(NSIndexPath *)indexPath {
//    
//    Character *character = (Character *) [self.characters objectAtIndex:indexPath.item];
//    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    DetailCharacterInformation *detailCharacterInformation = [sb instantiateViewControllerWithIdentifier:@"DetailCharacterInformation"];
//    detailCharacterInformation.character = character;
//    [self.navigationController pushViewController:detailCharacterInformation animated:YES];
//}


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
