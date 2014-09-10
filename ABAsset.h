//
//  ABAsset.h
//  Audience Builder
//
//  Created by Francisco Chavez on 9/10/14.
//  Copyright (c) 2014 Ooyala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ABAsset : NSObject

@property (strong,nonatomic) UIImage *previewImage;
@property (strong,nonatomic) NSString *embedCode;
@property (strong,nonatomic) NSString *assetName;

@end
