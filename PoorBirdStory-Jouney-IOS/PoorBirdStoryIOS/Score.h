//
//  Score.h
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/25/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Score : UILabel{
    NSObject *this_game;
    UILabel *scoreBird;
    @public int score;
    
    CGFloat scoreX;
    CGFloat scoreY;
    CGFloat scoreWidth;
    CGFloat scoreHeight;
    
    float xScored;

}
- (void) initiation :( NSObject* )gaming ;
- (void) Draw;
- (void) Update;
- (void) setScore :( int )scoreParam ;
@end

NS_ASSUME_NONNULL_END
