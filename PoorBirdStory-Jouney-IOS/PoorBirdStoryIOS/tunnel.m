//
//  tunnel.m
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/21/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import "tunnel.h"
#import "game.h"

@implementation tunnel

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (void) initiation:( UIViewController* )gaming{
    tunnelAbove = self;
    this_game = (game *)gaming;
    
    tunnelBottom = ((game *)this_game)->tunnelBottom;
    
    [tunnelAbove setImage:[UIImage imageNamed: @"pipeAbove.png"]];
    [tunnelBottom setImage:[UIImage imageNamed: @"pipeBottom.png"]];
    
    pipeWidth = [UIScreen mainScreen].bounds.size.width * 0.1;
    pipeHeight = [UIScreen mainScreen].bounds.size.height * 0.6;
    
    hRange = 0.2 * [UIScreen mainScreen].bounds.size.height;
    
    xTop = [UIScreen mainScreen].bounds.size.width + pipeWidth;
    
    yTopMin = pipeHeight * 0.6;
    yTop = -1 * (arc4random() % yTopMin);

    xBottom = xTop;
    yBottom = yTop+pipeHeight + hRange;
    
    tunnelAbove.frame = CGRectMake(xTop, yTop, pipeWidth, pipeHeight);
    tunnelBottom.frame = CGRectMake(xTop, yBottom, pipeWidth, pipeHeight);
}
- (void) Draw;{
    tunnelAbove.frame = CGRectMake(xTop, yTop, pipeWidth, pipeHeight);
    tunnelBottom.frame = CGRectMake(xTop, yBottom, pipeWidth, pipeHeight);

}
- (void) Update;{
    if (((game *)this_game)->start_game == 0) {
        return;
    }
    xTop--;
    if (xTop<=0 - pipeWidth) {
        xTop = [UIScreen mainScreen].bounds.size.width;
        xBottom = xTop;
        yTop = -1 * (arc4random() % yTopMin);
        yBottom = yTop + pipeHeight + hRange;
    }
}
@end
