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
#import "Comics.h"
#import "Series.h"
#import "Stories.h"
#import "Events.h"
#import "VariantImageName.h"

@interface DetailCharacterInformation()

@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;
@property (weak, nonatomic) IBOutlet UITextView *characterDescriptionText;
@property (weak, nonatomic) IBOutlet UILabel *characterUid;
@property (weak, nonatomic) IBOutlet UILabel *characterName;
@property (weak, nonatomic) IBOutlet UILabel *comicsNumber;
@property (weak, nonatomic) IBOutlet UILabel *seriesNumber;
@property (weak, nonatomic) IBOutlet UILabel *storiesNumber;
@property (weak, nonatomic) IBOutlet UILabel *eventsNumber;


@end

@implementation DetailCharacterInformation


- (void)updateUI {
    
    [self.characterImageView getImageWithURL:[self urlForImageCharacter]];
    if ([self.character.descriptionBio isEqualToString:@""]){
        self.characterDescriptionText.textColor = [UIColor redColor];
        self.characterDescriptionText.text = @"Information not found";
    } else {
        self.characterDescriptionText.text = self.character.descriptionBio;
    }
    self.characterUid.text = [NSString stringWithFormat:@"%@", self.character.uid];
    self.comicsNumber.text = [NSString stringWithFormat:@"%@", self.character.comics.available];
    self.seriesNumber.text = [NSString stringWithFormat:@"%@", self.character.series.available];
    self.storiesNumber.text = [NSString stringWithFormat:@"%@", self.character.stories.available];
    self.eventsNumber.text = [NSString stringWithFormat:@"%@", self.character.events.available];
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
