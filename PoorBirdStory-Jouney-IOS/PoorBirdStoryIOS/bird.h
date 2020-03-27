//
//  bird.h
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/21/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface bird : UIImageView {
    NSObject *this_game;
    UIImageView *birdImg;
    
    @public CGFloat x;
    float y;
    float width;
    float height;
    float speedY;
    float acceleration;
    int currentFrame;
    int imageIndex;
    
    
}
- (void) initiation :( NSObject* )gaming ;
- (void) Draw;
- (void) Update;
- (void) Birdflap;

@end

NS_ASSUME_NONNULL_END
