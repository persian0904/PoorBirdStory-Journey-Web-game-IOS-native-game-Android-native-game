//
//  live.m
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/25/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import "live.h"
#import "game.h"

@implementation live

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (void) initiation :( NSObject* )gaming ;{
    this_game =(game *) gaming;
    liveCounter = ((game *)this_game)->noOfLive;
    liveImg1 = self;
    liveImg2 = ((game *)this_game)->liveImgViewer2;
    liveImg3 = ((game *)this_game)->liveImgViewer3;
    
    [liveImg1 setImage:[UIImage imageNamed: @"live.png"]];
    [liveImg2 setImage:[UIImage imageNamed: @"live.png"]];
    [liveImg3 setImage:[UIImage imageNamed: @"live.png"]];
    liveImg1.frame = CGRectMake(10, 20, 15, 11);
    liveImg2.frame = CGRectMake(25, 20, 15, 11);
    liveImg3.frame = CGRectMake(40, 20, 15, 11);
}
- (void) Draw;{
    liveCounter = ((game *)this_game)->noOfLive;
    switch (liveCounter) {
        case 0:
            liveImg1.hidden = YES;
            liveImg2.hidden = YES;
            liveImg3.hidden = YES;
            break;
        case 1:
            liveImg2.hidden = YES;
            liveImg3.hidden = YES;
            break;
        case 2:
            liveImg3.hidden = YES;
            break;
        case 3:
            liveImg1.hidden = NO;
            liveImg2.hidden = NO;
            liveImg3.hidden = NO;
            break;
        break;
    }
}
- (void) Update;{

}

@end
