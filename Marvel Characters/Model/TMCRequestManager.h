//
//  TMCRequestManager.h
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMCRequestManager : NSObject

+ (instancetype)sharedInstance;

- (void)startSession;
- (void)getRequestWithURL:(NSString *)url completion:(void (^)(NSDictionary *elements, NSError *error))completion;



@end
