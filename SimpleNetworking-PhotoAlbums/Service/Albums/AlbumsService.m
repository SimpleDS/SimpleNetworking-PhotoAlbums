//
//  AlbumsService.m
//  SimpleNetworking-PhotoAlbums
//
//  Created by Dylan Sewell on 8/13/19.
//  Copyright © 2019 dylansewell. All rights reserved.
//

#import "AlbumsService.h"
#import "Album.h"

// Placeholder Endpoint to hold our album data
static const NSString *apiEndpoint = @"http://jsonplaceholder.typicode.com/albums";

@implementation AlbumsService

-(void)getAllAlbumsWithCompletionHandler:(ResponseBlock)completionBlock {
    // NSURLSession provides a simple singleton object that allows us to make basic network requests
    // I'll be using this approach to demonstrate the basic capabilities of Networking in iOS.
    // This basic solution has its limitations.
    // In a more complex application, I would create customized configurations basic on the needs
    // of that function/feature (such as background uploading or downloading tasks)
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",apiEndpoint]]];
    
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            // handle error here
            NSLog(@"error");
            return;
        }
        
        // Parse the JSON from the data object
        NSArray *json = [NSJSONSerialization JSONObjectWithData:data options: 0 error: nil];
    
        // Transform into custom domain model objects and return
        NSArray *arrAlbums = [self storeAlbumsWithJSON:json];
        
        // Signal to caller that
        completionBlock(arrAlbums, error);
        
    }];
    
    [task resume];
    
}

// Serialized JSON to Custom Domain Object Mapping
-(NSArray *)storeAlbumsWithJSON:(NSArray *)json {
    NSMutableArray *arrAlbums = [NSMutableArray new];
    for (NSDictionary *albumData in json) {
        NSNumber *identifier = albumData[@"id"];
        NSString *title = albumData[@"title"];
        Album *album = [[Album alloc] initWithTitle:title identifier:identifier];
        [arrAlbums addObject:album];
    }
    return [arrAlbums copy];
}
@end
