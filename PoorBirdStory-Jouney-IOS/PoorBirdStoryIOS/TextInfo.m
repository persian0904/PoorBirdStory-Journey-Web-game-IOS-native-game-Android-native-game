//
//  TextInfo.m
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/25/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import "TextInfo.h"
#import "game.h"

@implementation TextInfo

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void) initiation :( NSObject* )gaming;{
    this_game =(game *) gaming;
    textInfo = self;
    //textInfo.text = @"The Story Of a Poor Bird";
    textInfo.textColor = UIColor.yellowColor;
    txtStr = @"The Story Of a Poor Bird";
    //scoreWidth = [UIScreen mainScreen].bounds.size.width * 0.3;
    //scoreHeight = [UIScreen mainScreen].bounds.size.height*0.2;
    txtTextWidth = [UIScreen mainScreen].bounds.size.width * 0.5;
    txtTextHeight = ((game *)this_game)->birdViewer->y + [UIScreen mainScreen].bounds.size.height*0.1;
}
- (void) Draw;{
    textInfo.text = [NSString stringWithFormat:txtStr];
    textInfo.center = CGPointMake(txtTextWidth,txtTextHeight);
}
- (void) Update;{
    if (((game *)this_game)->start_game == 1) {
        textInfo.hidden = YES;
    }
    if (((game *)this_game)->gameOverFlg == 1) {
        txtStr = @"tap to continue";
        textInfo.textColor = UIColor.yellowColor;
        textInfo.hidden = NO;
    }
}
@end
