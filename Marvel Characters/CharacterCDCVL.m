//
//  CharacterCDCVL.m
//  Marvel Characters
//
//  Created by Максим on 31.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "CharacterCDCVL.h"

@implementation CharacterCDCVL

- (UICollectionViewFlowLayout *)flowLayout{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 20.0f;
    flowLayout.minimumInteritemSpacing = 10.0f;
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    return flowLayout;
}

@end
