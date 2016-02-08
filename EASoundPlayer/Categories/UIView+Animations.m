//
//  UIView+Animations.m
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import <objc/runtime.h>
#import "UIView+Animations.h"
#import <JHChainableAnimations.h>

@implementation UIView (Animations)
@dynamic animationActive;

- (void)spin {
    if (self.animationIsActive) return;

    self.animationActive = YES;
    self.rotate(360).easeOutBack.animateWithCompletion(0.75, ^{
        self.animationActive = NO;
    });
}

#pragma mark - Associated Objects
- (void)setAnimationActive:(BOOL)animationActive {
    objc_setAssociatedObject(self, @selector(animationIsActive), @(animationActive), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)animationIsActive {
    NSNumber *associatedNumber = objc_getAssociatedObject(self, @selector(animationIsActive));
    return [associatedNumber boolValue];
}

@end
