//
//  bird.m
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/21/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import "bird.h"
#import "game.h"

@implementation bird

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (void) initiation:( NSObject* )gaming ;{
    this_game =(game *) gaming;

    birdImg = self;
    
    x = 0.3 * [UIScreen mainScreen].bounds.size.width;
    y = 0.3 * [UIScreen mainScreen].bounds.size.height;
    
    width = 34;
    height = 24;
    
    speedY = 0;
    acceleration = 0.3;
    
    currentFrame = 0;
    imageIndex = 1;
    
}
- (void) Draw;{
    [birdImg setImage:[UIImage imageNamed: [NSString stringWithFormat:@"bird%d.png", imageIndex]]];
    birdImg.frame = CGRectMake(x, y, width, height);
    
}
- (void) Birdflap;{
    speedY = -7;
    ((game *)this_game)->start_game = 1;
}
- (void) Update;{
    if (((game *)this_game)->start_game == 0) {
        return;
    }
    currentFrame ++;
    currentFrame += 1;
    if (currentFrame == 50) {
        currentFrame = 0;
    }
    if (currentFrame % 30 == 0) {
        [self changeImage];
    }
    speedY +=acceleration;
    y += speedY;
    [self gameOver];
    //NSLog(@"this_game->birdViewer->y:=%f",((game *)this_game)->birdViewer->y);
}

- (void) changeImage{
    imageIndex++;
    if (imageIndex > 2) {
        imageIndex = 1;
    }
}

- (void) gameOver{
    if (((game *)this_game)->birdViewer->y >= [UIScreen mainScreen].bounds.size.height - ((game *)this_game)->baseViewer->height - height) {
        y = [UIScreen mainScreen].bounds.size.height - ((game *)this_game)->baseViewer->height - height;
        imageIndex = 3;
        ((game *)this_game)->start_game = 0;
        ((game *)this_game)->gameOverFlg = 1;
        ((game *)this_game)->noOfLive --;
    }
    if (((game *)this_game)->birdViewer->y <= 0) {
        y = 0;
        imageIndex = 3;
        ((game *)this_game)->start_game = 0;
        ((game *)this_game)->gameOverFlg = 1;
        ((game *)this_game)->noOfLive --;
    }

    if(CGRectIntersectsRect(self.frame, ((game *)this_game)->tunnelAbove.frame)){
        imageIndex = 3;
        ((game *)this_game)->start_game = 0;
        ((game *)this_game)->gameOverFlg = 1;
        ((game *)this_game)->noOfLive --;
    }
    if(CGRectIntersectsRect(self.frame, ((game *)this_game)->tunnelBottom.frame)){
        imageIndex = 3;
        ((game *)this_game)->start_game = 0;
        ((game *)this_game)->gameOverFlg = 1;
        ((game *)this_game)->noOfLive --;
    }
}


@end
