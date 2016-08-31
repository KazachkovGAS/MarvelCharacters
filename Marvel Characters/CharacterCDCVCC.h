//
//  CharacterCDCVCC.h
//  Marvel Characters
//
//  Created by Максим on 31.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Character.h"

@interface CharacterCDCVCC : UICollectionViewCell

@property (strong, nonatomic) Character *character;

-(void)updateUI;


@end
