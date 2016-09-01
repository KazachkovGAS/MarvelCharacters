//
//  UIImageView +getImageFromUrl.m
//  Marvel Characters
//
//  Created by Максим on 01.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "UIImageView+getImageFromUrl.h"

@implementation UIImageView (getImageFromUrl)

- (UIImageView *)getImageWithURL:(NSString *)url {
    UIImageView *image = nil;
    [self getImageFromURL:url completion:^(NSData *imageData, NSError *error) {
        if (!error) {
            self.image = [UIImage imageWithData:imageData];
        }
    }];
    return image;
}

- (void)getImageFromURL:(NSString *)url completion:(void (^)(NSData *imageData, NSError *error))completion{
    
    NSFileManager *fileManager = [[NSFileManager alloc] init];
    NSError *error;
    NSString *tempDir = NSTemporaryDirectory();
    NSString *imagesDir = [tempDir stringByAppendingPathComponent:@"images"];
    if (![fileManager fileExistsAtPath:imagesDir]){
        if ([fileManager createDirectoryAtPath:imagesDir
                   withIntermediateDirectories:YES
                                    attributes:nil
                                         error:&error]) {
            NSLog(@"Successfully created the directory");
        } else {
            NSLog(@"Failed to create the directory. Error = %@", error);
        }
    } else {
        NSLog(@"Directory %@ already exists",imagesDir);
       
    }
    NSString *filePath = [imagesDir stringByAppendingPathComponent:url];
    if ([fileManager fileExistsAtPath:filePath]) {
        NSLog(@"FILE EXISTS!");
        NSData *data = [[NSData alloc] initWithContentsOfFile:imagesDir];
        completion(data, nil);
    } else {
        NSLog(@"START DOWNLOAD FROM URL %@", url);
        NSURLSession *session = [self startSession];
        NSURLRequest *request = [self prepareRequestWithUrl:url];
        
        NSURLSessionDownloadTask *sessionDownloadTask = [session downloadTaskWithRequest:request
                                                                            completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                                                [fileManager copyItemAtURL:location
                                                                                                     toURL:[NSURL fileURLWithPath:filePath]
                                                                                                     error:&error];
                                                                                if (!error){
                                                                                    NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
                                                                                    completion(data, nil);
                                                                                } else {
                                                                                    completion(nil, error);
                                                                                }
                                                                            }];

        [sessionDownloadTask resume];
    }
    
}

- (NSURLSession *)startSession {
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    return session;
}

- (NSURLRequest *)prepareRequestWithUrl: (NSString *)url{
    
    NSURL *requestURL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    return request;
    
}




@end
