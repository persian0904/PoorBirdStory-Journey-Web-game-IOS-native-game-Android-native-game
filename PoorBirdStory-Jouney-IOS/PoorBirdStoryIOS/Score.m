//
//  Score.m
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/25/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import "Score.h"
#import "game.h"
#import "UIDeviceHardware.h"

@implementation Score

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (void) initiation :( NSObject* )gaming;{
    this_game =(game *) gaming;
    scoreBird = self;
    scoreBird.text = @"0";
    scoreWidth = [UIScreen mainScreen].bounds.size.width * 0.5;
    scoreHeight = [UIScreen mainScreen].bounds.size.height*0.04;
    xScored = lroundf((((game *)this_game)->birdViewer.frame.origin.x));
    score = 0;
}
- (void) Draw;{
    scoreBird.text = [NSString stringWithFormat:@"%d",score];
    scoreBird.center = CGPointMake(scoreWidth,scoreHeight);
    //NSLog(@"xScored = %f",xScored);
}
- (void) Update;{
    
    int rightunnelAbove =  ((game *)this_game)->tunnelAbove.frame.origin.x + ((game *)this_game)->tunnelAbove->pipeWidth;
    if (xScored == rightunnelAbove) {
        score ++;
    }
}
- (void) setScore :( int )scoreParam ;{
    score = scoreParam;
}
@end
