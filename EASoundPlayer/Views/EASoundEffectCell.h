//
//  EASoundEffectCell.h
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EASoundEffectCell : UICollectionViewCell
- (void)configureWithTitle:(NSString*)title;

+ (NSString*)reuseIdentifier;
+ (UINib*)nib;
@end
