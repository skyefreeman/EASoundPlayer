//
//  EASoundEffectCell.m
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import "EASoundEffectCell.h"

@interface EASoundEffectCell()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@end

@implementation EASoundEffectCell

- (void)awakeFromNib {
    self.backgroundColor = [UIColor colorWithRed:1.000 green:0.261 blue:0.228 alpha:1.000];
    self.titleLabel.textColor = [UIColor whiteColor];

    self.layer.borderColor = [UIColor whiteColor].CGColor;
    self.layer.borderWidth = 1.0;
}

- (void)configureWithTitle:(NSString*)title {
    self.titleLabel.text = title;
}

#pragma mark - Convenience
+ (NSString*)reuseIdentifier {
    return NSStringFromClass([self class]);
}

+ (UINib*)nib {
    return [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
}
@end
