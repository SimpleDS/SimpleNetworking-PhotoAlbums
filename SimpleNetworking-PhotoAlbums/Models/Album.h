//
//  Album.h
//  SimpleNetworking-PhotoAlbums
//
//  Created by Dylan Sewell on 8/13/19.
//  Copyright © 2019 dylansewell. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Album : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSNumber *identifier;
-(instancetype)initWithTitle:(NSString *)title identifier:identifier;
@end

NS_ASSUME_NONNULL_END
