//
//  ABViewController.h
//  Audience Builder
//
//  Created by Francisco Chavez on 9/10/14.
//  Copyright (c) 2014 Ooyala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ABAsset.h"

@class OOOoyalaPlayerViewController;

@interface ABViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong, nonatomic) NSArray *assets;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) OOOoyalaPlayerViewController *ooyalaPlayerViewController;

@end
