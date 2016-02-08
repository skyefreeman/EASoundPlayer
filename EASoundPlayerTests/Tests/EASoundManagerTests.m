//
//  EASoundManagerTests.m
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import "EASoundEffect.h"
#import "EASoundManager.h"
#import "NSString+FileNames.h"


@interface EASoundManager(Tests)
@property (nonatomic) EASoundEffect *currentEffect;
@end

@implementation EASoundManager(Tests)
@dynamic currentEffect;

- (void)testPlaySound:(AVAudioPlayer*)sound {
    self.currentEffect = (EASoundEffect*)sound;
    [self playSound:sound];
}

@end

SpecBegin(SoundManager)

__block EASoundEffect *soundEffect;
__block EASoundEffect *soundEffect2;
__block EASoundManager *soundManager = [EASoundManager sharedManager];

beforeEach(^{
    soundEffect = [[EASoundEffect alloc] initWithFilename:[NSString ho]];
    soundEffect2 = [[EASoundEffect alloc] initWithFilename:[NSString whoosh]];
});

describe(@"playSound", ^{
    it(@"plays the audio file", ^{
        [soundManager playSound:soundEffect];
        expect(soundEffect.playing).to.beTruthy;
    });
    
    it(@"replaces the current audio file", ^{
        [soundManager playSound:soundEffect];
        expect(soundEffect.playing).to.beTruthy;
        [soundManager playSound:soundEffect2];
        expect(soundEffect2.playing).to.beTruthy;
    });
});

describe(@"stopSound", ^{
    it(@"stops the current audio file", ^{
        [soundManager playSound:soundEffect];
        [soundManager stopSound];
        expect(soundEffect.playing).to.beFalsy;
    });
});

SpecEnd

