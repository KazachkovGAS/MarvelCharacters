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

@interface CharacterCDCVCC ()

@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;
@property (weak, nonatomic) IBOutlet UILabel *CharacterNameLabel;


@end
@implementation CharacterCDCVCC


-(void)updateUI{
    
    NSString *url = [self urlForImage];
    self.characterImageView = [self.characterImageView getImageWithURL:url];
    _CharacterNameLabel.text = self.character.name;
}

- (NSString *)urlForImage {
    NSString *urlForImage = self.character.image.path;
    NSString *imageExtension = self.character.image.extension;
    NSString *fullUrlForImage = [NSString stringWithFormat:@"%@/%@.%@",urlForImage, _portrait_uncanny, imageExtension];
    return fullUrlForImage;
}


@end
