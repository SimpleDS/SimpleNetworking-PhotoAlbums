//
//  AlbumsTableViewController.h
//  SimpleNetworking-PhotoAlbums
//
//  Created by Dylan Sewell on 8/13/19.
//  Copyright © 2019 dylansewell. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlbumsService.h"
NS_ASSUME_NONNULL_BEGIN

@interface AlbumsTableViewController : UITableViewController
@property (nonatomic, strong) NSMutableArray *albums;
@property (nonatomic, strong) AlbumsService *albumsService;
@end

NS_ASSUME_NONNULL_END
