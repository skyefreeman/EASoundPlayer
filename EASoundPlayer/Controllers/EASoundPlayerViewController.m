//
//  EASoundPlayerViewController.m
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import "EASoundPlayerViewController.h"

#import <ObjectiveSugar.h>

#import "EASoundManager.h"

#import "EASoundEffect.h"

#import "NSString+FileNames.h"

#import "EASoundEffectCell.h"
@interface EASoundPlayerViewController() <UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) EASoundManager *soundManager;
@property (nonatomic, strong) NSArray *soundEffects;
@end

@implementation EASoundPlayerViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.soundManager = [EASoundManager sharedManager];
    self.soundEffects = [[NSString allSoundFilenames] map:^id(NSString *fileName) {
        return [[EASoundEffect alloc] initWithFilename:fileName];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[EASoundEffectCell nib] forCellWithReuseIdentifier:[EASoundEffectCell reuseIdentifier]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.soundManager playSound:self.soundEffects.firstObject];
}

#pragma mark - UICollectionViewDataSource
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    EASoundEffectCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[EASoundEffectCell reuseIdentifier] forIndexPath:indexPath];
    [cell configureWithTitle:@"title"];
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat dimensions = self.view.frame.size.width/2 - 1;
    return CGSizeMake(dimensions, dimensions);
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"touched");
}

@end
