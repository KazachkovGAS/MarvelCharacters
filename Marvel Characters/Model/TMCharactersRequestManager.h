//
//  TMCharactersRequestManager.h
//  Marvel Characters
//
//  Created by Максим on 31.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "TMCRequestManager.h"

@interface TMCharactersRequestManager : NSObject

- (void)getCharactersWithCompletion:(void (^) (NSArray *characters, NSError *error))completion;


@end
