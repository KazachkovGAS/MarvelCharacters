//
//  CharacterCDCVCC.m
//  Marvel Characters
//
//  Created by Максим on 31.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "CharacterCDCVCC.h"

@interface CharacterCDCVCC ()

@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;
@property (weak, nonatomic) IBOutlet UILabel *CharacterNameLabel;

@end
@implementation CharacterCDCVCC


-(void)updateUI{
    _CharacterNameLabel.text = self.character.name;
}



@end
