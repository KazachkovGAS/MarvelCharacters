//
//  TMCharactersRequestManager.m
//  Marvel Characters
//
//  Created by Максим on 31.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "TMCharactersRequestManager.h"
#import "Urls.h"
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import "Character.h"

@interface TMCharactersRequestManager()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation TMCharactersRequestManager

- (void)getCharactersWithCompletion:(void (^) (NSArray *characters, NSError *error))completion {
    [[TMCRequestManager sharedInstance] getRequestWithURL:_marvelCharactersURL
                                               completion:^(NSDictionary *elements, NSError *error) {
                                                   NSArray *characters = elements[@"data"][@"results"];
                                                   NSArray *mappedCharacters = [Character addNewData:characters inManagedObjectContext:self.managedObjectContext];
                                                   if (error != nil) {
                                                       completion(nil, error);
                                                   } else {
                                                       completion(mappedCharacters, nil);
                                                   }
                                                   if ((![self.managedObjectContext save:&error])&&(error != nil)) {
                                                       NSLog(@"Whoops something gone wrong. Could not save to Core Data");
                                                   } else if (error == nil){
                                                       [self printDatabase];
                                                   }
                                               }];
}

- (NSManagedObjectContext *)managedObjectContext {
    if (!_managedObjectContext){
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _managedObjectContext = delegate.managedObjectContext;
    }
    return _managedObjectContext;
}

-(void)printDatabase{
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Character"];
    id result = [self.managedObjectContext executeFetchRequest:request error:nil];
    NSLog(@"Added %lu records in DataBase", (unsigned long)[result count]);
}

@end
