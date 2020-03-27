//
//  game.h
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/18/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "background.h"
#import "bird.h"
#import "tunnel.h"
#import "information.h"
#import "base.h"
#import "live.h"
#import "Score.h"
#import "TextInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface game : UIViewController{
    
@public IBOutlet background *backgroundViewer;
@public IBOutlet bird *birdViewer;
@public IBOutlet base *baseViewer;
@public IBOutlet tunnel *tunnelAbove;
@public IBOutlet tunnel *tunnelBottom;
@public IBOutlet live *liveImgViewer1;
@public IBOutlet live *liveImgViewer2;
@public IBOutlet live *liveImgViewer3;
@public IBOutlet Score *scoreLB;
@public IBOutlet TextInfo *textInfo;
    
    float *start_game;
    float *gameOverFlg;
    int noOfLive;
    int retryFlg;
    NSTimer *GameMovement;
}
- (void) Initiation;
- (void) Update;
- (void) Draw;
- (void)setSroce:( NSString* )score;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;

@end

NS_ASSUME_NONNULL_END
