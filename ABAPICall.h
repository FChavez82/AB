//
//  ABAPICall.h
//  Audience Builder
//
//  Created by Francisco Chavez on 9/10/14.
//  Copyright (c) 2014 Ooyala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OOOoyalaAPIClient.h"

@interface ABAPICall : NSObject
@property (strong,nonatomic) OOOoyalaAPIClient *apiClient;
@property (strong,nonatomic) NSObject *assetData;

-(NSArray *)getAssets;

@end
