//
//  ABViewController.m
//  Audience Builder
//
//  Created by Francisco Chavez on 9/10/14.
//  Copyright (c) 2014 Ooyala. All rights reserved.
//

#import "ABViewController.h"
#import "ABAPICall.h"
#import "ABAsset.h"
#import "OOOoyalaPlayer.h"
#import "OOOoyalaPlayerViewController.h"
#import "OOPlayerDomain.h"

@interface ABViewController ()
@property (weak, nonatomic) IBOutlet UIView *playerView;

@end

@implementation ABViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *PCODE = @"locm46NOW1gW9IE3U5GPBXK2G_Bj";
    //    NSString *APIKEY = @"locm46NOW1gW9IE3U5GPBXK2G_Bj.uYcsP";
    //    NSString *SECRETKEY = @"d6c6tx0WeLDoRymCS-4RSeTvaaehghhpS9ltOemX";
    NSString *PLAYERDOMAIN = @"http://www.ooyala.com";
    
    self.ooyalaPlayerViewController = [[OOOoyalaPlayerViewController alloc] initWithPcode:PCODE domain:[[OOPlayerDomain alloc] initWithString:PLAYERDOMAIN]];
    [self.ooyalaPlayerViewController.view setFrame:self.playerView.bounds];
    [self.playerView addSubview:self.ooyalaPlayerViewController.view];
    
    ABAPICall *apiCall = [[ABAPICall alloc] init];
    self.assets = [apiCall getAssets];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.assets count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    //NSDictionary *singleAsset = self.assets[indexPath.row];
    ABAsset *singleAsset = self.assets[indexPath.row];
    
    UILabel *label = (UILabel *)[cell viewWithTag:100];
    label.text = singleAsset.assetName;
    
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:50];
    //if(imageView.image == nil){
    imageView.image = singleAsset.previewImage;
    //}
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ABAsset *assetTapped = self.assets[indexPath.row];
    
    [self.ooyalaPlayerViewController.player setEmbedCode:assetTapped.embedCode];
    [self.ooyalaPlayerViewController.player play];
}


@end
