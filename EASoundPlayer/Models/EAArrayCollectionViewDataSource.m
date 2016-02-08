//
//  EAArrayCollectionViewDataSource.m
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import "EAArrayCollectionViewDataSource.h"

@interface EAArrayCollectionViewDataSource()
@property (nonatomic, strong) NSArray *itemArray;
@property (nonatomic, copy) NSString *reuseIdentifier;
@property (nonatomic, copy) EAArrayConfigureBlock configureBlock;
@end

@implementation EAArrayCollectionViewDataSource

- (instancetype)init {
    return nil;
}

- (instancetype)initWithArray:(NSArray*)itemArray configureBlock:(EAArrayConfigureBlock)block cellReuseID:(NSString*)reuseID {
    self = [super init];
    if (!self) return nil;
    
    self.itemArray = itemArray;
    self.reuseIdentifier = reuseID;
    self.configureBlock = [block copy];

    return self;
}

- (id)itemAtIndexPath:(NSIndexPath*)indexPath {
    return [self.itemArray objectAtIndex:(NSUInteger)indexPath.row];
}

#pragma mark - UICollectionViewDataSource
- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.reuseIdentifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureBlock(cell,item);
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return (long)self.itemArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

@end
