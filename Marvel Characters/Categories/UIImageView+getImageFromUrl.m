//
//  UIImageView +getImageFromUrl.m
//  Marvel Characters
//
//  Created by Максим on 01.09.16.
//  Copyright © 2016 Максим. All rights reserved.
//

#import "UIImageView+getImageFromUrl.h"

@implementation UIImageView (getImageFromUrl)

- (void)getImageWithURL:(NSString *)url {
  //  UIImageView *image = nil;
    [self getImageFromURL:url completion:^(NSData *imageData, NSError *error) {
        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.image = [UIImage imageWithData:imageData];
            });
        } else {
            self.image = nil;
        }
    }];
}

- (void)getImageFromURL:(NSString *)url completion:(void (^)(NSData *imageData, NSError *error))completion{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *fileManagerError;
    NSString *tempDir = NSTemporaryDirectory();
//    NSArray *urls = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
//    NSURL *documentsDirectory = [urls objectAtIndex:0];
//    NSString *imagesDir = [[documentsDirectory URLByAppendingPathComponent:@"images"] absoluteString];
    NSString *imagesDir = [tempDir stringByAppendingPathComponent:tempDir];
    if (![fileManager fileExistsAtPath:imagesDir]){
        if ([fileManager createDirectoryAtPath:imagesDir
                   withIntermediateDirectories:YES
                                    attributes:nil
                                         error:&fileManagerError]) {
            NSLog(@"Successfully created the directory");
        } else {
            NSLog(@"Failed to create the directory. Error = %@", fileManagerError);
        }
    } else {
        NSLog(@"Directory %@ already exists",imagesDir);
       
    }
    NSData *base64EncodedImageURLName = [[url dataUsingEncoding:NSUTF8StringEncoding] base64EncodedDataWithOptions:0];
    NSString *decodedImageURLName = [[NSString alloc] initWithData:base64EncodedImageURLName encoding:NSUTF8StringEncoding];
    NSLog(@"URL : %@", url);
    NSLog(@"Encoded to : %@", decodedImageURLName);
    NSString *filePath = [imagesDir stringByAppendingPathComponent:decodedImageURLName];
    if ([fileManager fileExistsAtPath:filePath]) {
        NSLog(@"FILE EXISTS!");
        NSData *data = [[NSData alloc] initWithContentsOfFile:filePath];
        completion(data, nil);
    } else {
        NSLog(@"START DOWNLOAD FROM URL %@", url);
        NSURLSession *session = [self startSession];
        NSURLRequest *request = [self prepareRequestWithUrl:url];
        
        NSURLSessionDownloadTask *sessionDownloadTask = [session downloadTaskWithRequest:request
                                                                            completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                                                if (error == nil) {

                                                                                    NSData *dataImage = [NSData dataWithContentsOfURL:location];
                                                                                    [dataImage writeToFile:filePath atomically:YES];
                                                                                    completion(dataImage, nil);
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
