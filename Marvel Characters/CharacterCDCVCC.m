//
//  CharacterCDCVCC.m
//  Marvel Characters
//
//  Created by Максим on 31.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "CharacterCDCVCC.h"
#import "UIImageView+getImageFromUrl.h"
#import "Thumbnail.h"
#import "VariantImageName.h"
#import "DetailCharacterInformation.h"


@interface CharacterCDCVCC ()

@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;
@property (weak, nonatomic) IBOutlet UILabel *CharacterNameLabel;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *visualEffectView;


@end
@implementation CharacterCDCVCC



-(void)updateUI{
    
    [self.characterImageView getImageWithURL:[self urlForImageCharacter]];
    _CharacterNameLabel.text = self.character.name;
}

- (NSString *)urlForImageCharacter {
    NSString *urlForImage = self.character.image.path;
    NSString *imageExtension = self.character.image.extension;
    NSString *fullUrlForImage = [NSString stringWithFormat:@"%@/%@.%@",urlForImage, _portrait_uncanny, imageExtension];
    return fullUrlForImage;
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue
//                 sender:(id)sender{
//    if ([segue.identifier isEqualToString:@"Show Detail Character Information"]){
//        if ([segue.destinationViewController isKindOfClass:[DetailCharacterInformation class]]){
//            [segue.destinationViewController setCharacter:self.character];
//        }
//    }
//}


@end
