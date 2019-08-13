//
//  AlbumsTableViewController.m
//  SimpleNetworking-PhotoAlbums
//
//  Created by Dylan Sewell on 8/13/19.
//  Copyright © 2019 dylansewell. All rights reserved.
//

#import "Album.h"
#import "AlbumsTableViewController.h"

@interface AlbumsTableViewController ()

@end

static NSString *cellIdentifer = @"AlbumTableViewCell";
static NSString *dataChanged = @"DataChanged";
@implementation AlbumsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.albums = [NSMutableArray new];
    
    // Initialize Albums Service
    self.albumsService = [[AlbumsService alloc] init];
    
    // Make Service call to fetch albums
    [self.albumsService getAllAlbumsWithCompletionHandler:^(NSArray * _Nonnull arr, NSError * _Nonnull error) {
        
        self.albums = [arr copy];
        
        // Alert to all listeners that data has been updated
        [self postDataChangedNotification];
        
        
    }];
    
    // Add observer and listen to notifications for data source updates
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleDataChangedNotification:)
                                                 name:dataChanged
                                               object:nil];
    
}

#pragma mark - KVO Methods
-(void)handleDataChangedNotification:(NSNotification *)notification {
    NSLog(@"Notification received");
    // Update UI on main thread since we'll be receiving this notification from the background thread
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

-(void)postDataChangedNotification {
    NSLog(@"notification posted");
    [[NSNotificationCenter defaultCenter] postNotificationName:dataChanged object:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.albums.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifer forIndexPath:indexPath];
    Album *album = self.albums[indexPath.row];
    cell.textLabel.text = album.title;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
