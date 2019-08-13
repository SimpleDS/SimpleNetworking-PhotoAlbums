//
//  AlbumsService.h
//  SimpleNetworking-PhotoAlbums
//
//  Created by Dylan Sewell on 8/13/19.
//  Copyright © 2019 dylansewell. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// Using type definition to make it easier to use block variables
typedef void(^ResponseBlock)(NSArray *arr, NSError *error);

@interface AlbumsService : NSObject

// Public method used to fetch all albums
-(void)getAllAlbumsWithCompletionHandler:(ResponseBlock)completionBlock;

@end

NS_ASSUME_NONNULL_END
