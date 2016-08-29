//
//  TMCRequestManager.m
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "TMCRequestManager.h"
#import "NSString+MD5Converter.h"
#import "Character.h"
#import "AppDelegate.h"

@interface TMCRequestManager()

@property(nonatomic, strong) NSURLSession *session;
@property(nonatomic, strong) NSManagedObjectContext *managedObjectContext;

#define _publicKey   @"44c6606f72114e4a9eaf84cb93fb8863"
#define _privateKey  @"a92b6b3b8140846adf4eeebb64d576b5570be727"

#define _baseURL @"http://gateway.marvel.com"
#define _marvelCharactersURL @"v1/public/characters"

#define _timestamp @1

@end

@implementation TMCRequestManager

-(NSManagedObjectContext *)managedObjectContext{
    if (!_managedObjectContext){
        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        _managedObjectContext = delegate.managedObjectContext;
    }
    return _managedObjectContext;
}

-(void)startSession{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    _session = [NSURLSession sessionWithConfiguration:configuration];
    
}



-(void)getRequest{
    NSString *stringURL = [NSString stringWithFormat:@"%@/%@?", _baseURL, _marvelCharactersURL];
    NSString *hash = [self timestamp:_timestamp publicKey:_publicKey privateKey:_privateKey];
    stringURL = [NSString stringWithFormat:@"%@ts=%@&apikey=%@&hash=%@",stringURL, _timestamp, _publicKey, hash];
    NSLog(@"URL For Request : %@", stringURL);
    NSURL *url = [NSURL URLWithString:stringURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
   
    NSURLSessionDataTask *sessionTask = [self.session dataTaskWithRequest:request
                    completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                     
                        error = nil;
                        id jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                        options:NSJSONReadingAllowFragments
                                                                          error:&error];
                        if (jsonObject != nil && error == nil){
                            NSLog(@"Successfully deserialized!");
                            if ([jsonObject isKindOfClass:[NSDictionary class]]){
                                NSDictionary *deserializedDictionary = (NSDictionary *)jsonObject;
                                NSLog(@"Deserialized JSON Dictionary = %@",deserializedDictionary);
                                // Adding data to the Core Data
                                for (id element in deserializedDictionary) {
                                    
                                    Character *newChacracter = [NSEntityDescription insertNewObjectForEntityForName:@"Character"
                                                                                             inManagedObjectContext:self.managedObjectContext];
                                }
                                
                                
                                
                                
                            } else {
                                NSLog(@"Was returned any another object. Don't know what to do. Deserializer returns only dictionaries or arrays!");
                            }
                        } else if (error != nil){
                            NSLog(@"AN error happend while deserializing the JSON data.");
                        }
                        
                        
                    }];
    [sessionTask resume];

}

-(NSString *)timestamp: (NSNumber *)ts publicKey: (NSString *)publicKey privateKey: (NSString *)privateKey{
    
   return [[NSString stringWithFormat:@"%@%@%@",ts, privateKey, publicKey] md5];
    
}








@end
