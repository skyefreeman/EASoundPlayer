//
//  EASoundEffect.m
//  EASoundPlayer
//
//  Created by Skye on 2/7/16.
//  Copyright © 2016 Skye Freeman. All rights reserved.
//

#import "EASoundEffect.h"

@implementation EASoundEffect
- (instancetype)initWithFilename:(NSString*)fileName {
    
    // Create the sound file
    NSString *file = [NSString stringWithFormat:@"%@/%@",[NSBundle mainBundle].resourcePath, fileName];
    NSError *dataError;
    NSData *data = [[NSData alloc] initWithContentsOfFile:file options:NSDataReadingMappedIfSafe error:&dataError];
    if (!data) NSLog(@"%@",[dataError localizedDescription]);
    
    // Create the audioPlayer using file data
    NSError *audioError;
    self = [super initWithData:data error:&audioError];
    if (!self) { NSLog(@"%@",[audioError localizedDescription]); return nil; }
    
    _fileName = fileName;
    
    return self;
}

@end
