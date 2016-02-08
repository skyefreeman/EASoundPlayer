//
//  EASoundEffectTests.m
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import "EASoundEffect.h"

SpecBegin(SoundEffect)

__block EASoundEffect *soundEffect;

beforeEach(^{
    soundEffect = [[EASoundEffect alloc] initWithFilename:@"fileName"];
});

describe(@"custom init", ^{
    it(@"generates file from filename", ^{
        expect(soundEffect).toNot.beNil;
    });
    
    it(@"saves the filename", ^{
        expect([soundEffect.fileName isEqualToString:@"fileName"]).to.beTruthy;
    });
});

SpecEnd
