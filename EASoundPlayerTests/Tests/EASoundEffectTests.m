//
//  EASoundEffectTests.m
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import <Specta/Specta.h>
#import <Expecta/Expecta.h>
#import "EASoundEffect.h"

SpecBegin(SoundEffect)

__block EASoundEffect *soundEffect;

beforeEach(^{
    soundEffect = [[EASoundEffect alloc] initWithFilename:@"fileName"];
});

describe(@"initializing", ^{
    it(@"generates sound player", ^{
        //        expect(menu.buttonSpacing).to.equal(0.0);
    });
});

SpecEnd
