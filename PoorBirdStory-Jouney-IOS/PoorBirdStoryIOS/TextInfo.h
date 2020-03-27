//
//  TextInfo.h
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/25/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TextInfo : UILabel{
    NSObject *this_game;
    UILabel *textInfo;
    int *score;
    NSString *txtStr;
    
    CGFloat scoreX;
    CGFloat scoreY;
    int txtTextWidth;
    int txtTextHeight;
}
- (void) initiation :( NSObject* )gaming ;
- (void) Draw;
- (void) Update;
@end

NS_ASSUME_NONNULL_END
