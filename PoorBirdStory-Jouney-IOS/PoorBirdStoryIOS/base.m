//
//  background.m
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/20/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import "base.h"
#import "game.h"

@implementation base

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void) initiation:( UIViewController* )gaming ;{

    this_game = (game *)gaming;
    x = 0;
    y = 0;
    height = 110;
    width = [UIScreen mainScreen].bounds.size.width;
    [imageBase setImage:[UIImage imageNamed: @"base.png"]];
    [imageBaseRun setImage:[UIImage imageNamed: @"base.png"]];
    
    imageBase.frame = CGRectMake(x, y, width, height);
    imageBaseRun.frame = CGRectMake(x + width, y, width, height);
    
}
- (void) Draw;{
    //NSLog(@"bacground draw");
    imageBase.frame = CGRectMake(x, y, width, height);
    imageBaseRun.frame = CGRectMake(x + width, y, width, height);
}

- (void) Update;{
    x = x-3;
    if (x <= -width) {
        x = 0;
    }
//    NSLog(@"base Update x=%f",x);
}

@end
