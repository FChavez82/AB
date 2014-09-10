//
//  ABAPICall.m
//  Audience Builder
//
//  Created by Francisco Chavez on 9/10/14.
//  Copyright (c) 2014 Ooyala. All rights reserved.
//

#import "ABAPICall.h"
#import "OOOoyalaPlayer.h"
#import "OOPlayerDomain.h"
#import "ABAsset.h"

@implementation ABAPICall

NSString * const PCODE = @"locm46NOW1gW9IE3U5GPBXK2G_Bj";
NSString * const APIKEY = @"locm46NOW1gW9IE3U5GPBXK2G_Bj.uYcsP";
NSString * const SECRETKEY = @"d6c6tx0WeLDoRymCS-4RSeTvaaehghhpS9ltOemX";
NSString * const PLAYERDOMAIN = @"http://www.ooyala.com";

-(OOOoyalaAPIClient *)apiClient{
    if (_apiClient == nil) {
        _apiClient = [[OOOoyalaAPIClient alloc] initWithAPIKey:APIKEY secret:SECRETKEY pcode:PCODE domain:[[OOPlayerDomain alloc] initWithString:PLAYERDOMAIN]];
    }
    return _apiClient;
};

-(NSArray *)getAssets{
    NSArray *assetArray = @[];
    //NSDictionary *singleAsset = @{};
    NSMutableArray *finalAssets = [[NSMutableArray alloc] init];
    
    NSObject *assetCall=[self.apiClient objectFromBacklotAPI:@"/assets" params:@{}];
    NSLog(@"ASSET CALL ===>",assetCall);
    
    if ([assetCall isKindOfClass:[NSDictionary class]]) {
        NSDictionary *response = (NSDictionary *)assetCall;
        assetArray = response[@"items"];
    }
    
    for (NSDictionary *asset in assetArray) {
        if ([asset[@"asset_type"] isEqual: @"video"]) {
            ABAsset *singleAsset = [[ABAsset alloc] init];
            singleAsset.assetName = asset[@"name"];
            singleAsset.embedCode = asset[@"embed_code"];
            singleAsset.previewImage = [[UIImage alloc] initWithData:[[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:asset[@"preview_image_url"]]]];
            
            [finalAssets addObject:singleAsset];
        }
    }
    
    return finalAssets;
}

@end
