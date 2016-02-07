//
//  EASoundPlayerViewController.m
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import "EASoundPlayerViewController.h"

// Libraries
#import <ObjectiveSugar.h>

// Managers
#import "EASoundManager.h"

// Models
#import "EASoundEffect.h"

// Categories
#import "NSString+FileNames.h"

@interface EASoundPlayerViewController()
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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.soundManager playSound:self.soundEffects.firstObject];
}

@end
