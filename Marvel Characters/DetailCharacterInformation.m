//
//  DetailCharacterInformation.m
//  Marvel Characters
//
//  Created by Максим on 02.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "DetailCharacterInformation.h"
#import "UIImageView+getImageFromUrl.h"
#import "Thumbnail.h"
#import "VariantImageName.h"

@interface DetailCharacterInformation()

@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;
@property (weak, nonatomic) IBOutlet UITextView *characterDescriptionText;
@property (weak, nonatomic) IBOutlet UITextField *characterUid;

@end

@implementation DetailCharacterInformation


- (void)updateUI {
    [self.characterImageView getImageWithURL:self.character.image.path];
    self.characterDescriptionText.text = self.character.descriptionBio;
    self.characterUid.text = [NSString stringWithFormat:@"%@",self.character.uid];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self updateUI];
}

- (NSString *)urlForImageCharacter {
    NSString *urlForImage = self.character.image.path;
    NSString *imageExtension = self.character.image.extension;
    NSString *fullUrlForImage = [NSString stringWithFormat:@"%@/%@.%@",urlForImage, _portrait_uncanny, imageExtension];
    return fullUrlForImage;
}

@end
