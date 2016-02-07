//
//  EASoundEffect.h
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>

@interface EASoundEffect : AVAudioPlayer
- (instancetype)initWithFilename:(NSString*)fileName;
@end
