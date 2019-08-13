//
//  Album.m
//  SimpleNetworking-PhotoAlbums
//
//  Created by Dylan Sewell on 8/13/19.
//  Copyright © 2019 dylansewell. All rights reserved.
//

#import "Album.h"

@implementation Album

-(instancetype)initWithTitle:(NSString *)title identifier:(NSNumber *)identifier {
    
    self = [super init];
    
    if (self) {
        _title = title;
        _identifier = identifier;
    }
    return self;
}
@end
