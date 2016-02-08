//
//  UIView+Animations.h
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Animations)
@property (nonatomic, getter=animationIsActive) BOOL animationActive;
- (void)spin;
@end
