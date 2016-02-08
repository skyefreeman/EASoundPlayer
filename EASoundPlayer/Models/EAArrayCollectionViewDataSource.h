//
//  EAArrayCollectionViewDataSource.h
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^EAArrayConfigureBlock)(id cell, id item);

@interface EAArrayCollectionViewDataSource : NSObject <UICollectionViewDataSource>
- (instancetype)initWithArray:(NSArray*)itemArray
               configureBlock:(EAArrayConfigureBlock)block
                  cellReuseID:(NSString*)reuseID;

- (id)itemAtIndexPath:(NSIndexPath*)indexPath;
@end
