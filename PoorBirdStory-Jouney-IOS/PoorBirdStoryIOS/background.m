//
//  background.m
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/20/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import "background.h"
#import "game.h"

@implementation background

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void) initiation:( UIViewController* )gaming ;{
//    NSLog(@"bacground initiation");
    this_game = (game *)gaming;
    
    x = 0;
    y = 0;
    height = [UIScreen mainScreen].bounds.size.height;
    width = [UIScreen mainScreen].bounds.size.width;
    [bgImageBase setImage:[UIImage imageNamed: @"background.png"]];
    [bgImageRun setImage:[UIImage imageNamed: @"background.png"]];
}
- (void) Draw;{
    //NSLog(@"bacground draw");
    bgImageBase.frame = CGRectMake(x, y, width, height);
    bgImageRun.frame = CGRectMake(x + width, y, width, height);

}

- (void) Update;{
    x = x-1;
    if (x <= -width) {
        x = 0;
    }
    //NSLog(@"bacground Update");
}

@end
