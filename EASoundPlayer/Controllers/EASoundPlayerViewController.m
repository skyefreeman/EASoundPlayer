//
//  EASoundPlayerViewController.m
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import "EASoundPlayerViewController.h"
#import "EAArrayCollectionViewDataSource.h"

#import "EAConstants.h"
#import "EASoundManager.h"
#import "EASoundEffect.h"
#import "EASoundEffectCell.h"

#import <ObjectiveSugar.h>
#import "NSString+FileNames.h"

@interface EASoundPlayerViewController() <UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) EASoundManager *soundManager;
@property (nonatomic, strong) NSArray *soundEffects;
@property (nonatomic, strong) EAArrayCollectionViewDataSource *dataSource;
@end

@implementation EASoundPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.soundManager = [EASoundManager sharedManager];
    self.soundEffects = [[NSString allSoundFilenames] map:^id(NSString *fileName) {
        return [[EASoundEffect alloc] initWithFilename:fileName];
    }];
    
    EAArrayConfigureBlock block = ^void(EASoundEffectCell *cell, EASoundEffect *effect){
        [cell configureWithTitle:effect.fileName];
    };
    self.dataSource = [[EAArrayCollectionViewDataSource alloc] initWithArray:self.soundEffects configureBlock:block cellReuseID:[EASoundEffectCell reuseIdentifier]];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self.dataSource;
    [self.collectionView registerNib:[EASoundEffectCell nib] forCellWithReuseIdentifier:[EASoundEffectCell reuseIdentifier]];
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat dimensions = self.view.frame.size.width/2;
    return CGSizeMake(dimensions, dimensions);
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"touched");
}

@end
