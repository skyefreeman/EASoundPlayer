//
//  EASoundManager.m
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import "EASoundManager.h"

@interface EASoundManager()
@property (nonatomic) AVAudioPlayer *soundEffect;
@end

@implementation EASoundManager

+ (instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static EASoundManager *sharedManager = nil;
    
    dispatch_once(&onceToken, ^{
        sharedManager = [[EASoundManager alloc] init];
    });
    
    return sharedManager;
}

#pragma mark - Public
- (void)playSound:(AVAudioPlayer*)sound {
    NSAssert([sound isKindOfClass:[AVAudioPlayer class]], @"Did not send an AVAudioplayer to EASoundManager");
    
    [self.soundEffect stop];
    
    self.soundEffect = sound;
    [self.soundEffect setCurrentTime:0.0];
    
    [self.soundEffect play];
}

- (void)stopSound {
    [self.soundEffect stop];
}

@end
