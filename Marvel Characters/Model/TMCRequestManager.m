//
//  TMCRequestManager.m
//  Marvel Characters
//
//  Created by Максим on 29.08.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "TMCRequestManager.h"
#import "Urls.h"
#import "ApiKeys.h"
#import "NSString+MD5Converter.h"
#import "Character.h"
#import "AppDelegate.h"

@interface TMCRequestManager()

@property(nonatomic, strong) NSURLSession *session;
@property(nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation TMCRequestManager

// Singleton
+ (instancetype)sharedInstance {
    static TMCRequestManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[TMCRequestManager alloc] init];
    });
    return instance;
}

- (void)startSession {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    self.session = [NSURLSession sessionWithConfiguration:configuration];

}

- (NSURLRequest *)prepareRequestWithUrl: (NSString *)url{
    [self startSession];
    NSString *stringURL = [NSString stringWithFormat:@"%@/%@?", _baseURL, url];
    NSString *hash = [self timestamp:_timestamp publicKey:_publicKey privateKey:_privateKey];
    stringURL = [NSString stringWithFormat:@"%@ts=%@&apikey=%@&hash=%@", stringURL, _timestamp, _publicKey, hash];
    NSLog(@"URL For Request : %@", stringURL);
    NSURL *requestURL = [NSURL URLWithString:stringURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    return request;
}

- (NSString *)timestamp: (NSNumber *)ts publicKey: (NSString *)publicKey privateKey: (NSString *)privateKey {
    
    return [[NSString stringWithFormat:@"%@%@%@",ts, privateKey, publicKey] md5];
}

- (void)getRequestWithURL:(NSString *)url completion:(void (^)(NSDictionary *elements, NSError *error))completion {

    NSURLRequest *request = [self prepareRequestWithUrl:url];
    
    NSURLSessionDataTask *sessionTask = [self.session dataTaskWithRequest:request
                                                        completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error){
                                                            
                                                            id jsonObject = [NSJSONSerialization JSONObjectWithData:data
                                                                                                            options:NSJSONReadingAllowFragments
                                                                                                              error:&error];
                                                            if (jsonObject != nil && error == nil) {
                                                                NSLog(@"Successfully deserialized JSON!");
                                                                if ([jsonObject isKindOfClass:[NSDictionary class]]) {
                                                                    NSDictionary *deserializedDictionary = (NSDictionary *)jsonObject;
                                                                    completion(deserializedDictionary, nil);
                                                                } else if (error) {
                                                                    completion(nil, error);
                                                                    NSLog(@"Was returned any another object. Don't know what to do. Deserializer returns only dictionaries or arrays!");
                                                                }
                                                            } else if (error != nil) {
                                                                NSLog(@"An error happend while deserializing the JSON data.");
                                                                completion(nil, error);
                                                            }
                                                        }];
    [sessionTask resume];
}











@end
