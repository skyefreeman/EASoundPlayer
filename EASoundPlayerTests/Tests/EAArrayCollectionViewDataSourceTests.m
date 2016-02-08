//
//  EAArrayCollectionViewDataSourceTests.m
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import "EAArrayCollectionViewDataSource.h"

SpecBegin(CollectionViewDataSource)

__block EAArrayCollectionViewDataSource *dataSource;

describe(@"Initialization", ^{
    it(@"requires custom init", ^{
        dataSource = [[EAArrayCollectionViewDataSource alloc] init];
        expect(dataSource).to.beNil;
    });
});

describe(@"Data Source", ^{
    __block UICollectionView *collectionView;
    
    beforeAll(^{
        NSArray *items = @[@"zero",@"one"];
        EAArrayConfigureBlock block = ^void(id cell, id item){};
        dataSource = [[EAArrayCollectionViewDataSource alloc] initWithArray:items configureBlock:block cellReuseID:@"reuseID"];
        
        collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
        collectionView.dataSource = dataSource;
    });
    
    it(@"has 1 section", ^{
        NSInteger sections = [dataSource numberOfSectionsInCollectionView:collectionView];
        expect(sections).to.equal(1);
    });
    
    it(@"has as many cell as items", ^{
        NSInteger cellCount = [dataSource collectionView:collectionView numberOfItemsInSection:0];
        expect(cellCount).to.equal(2);
    });
    
    it(@"allows retrieval of items", ^{
        NSIndexPath *indexpath = [NSIndexPath indexPathForRow:0 inSection:0];
        expect([dataSource itemAtIndexPath:indexpath]).to.equal(@"zero");
    });
});

SpecEnd
