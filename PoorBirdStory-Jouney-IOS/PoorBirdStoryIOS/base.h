//
//  background.h
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/20/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface base : UIView{
    UIViewController *this_game;
    IBOutlet UIImageView *imageBase;
    IBOutlet UIImageView *imageBaseRun;
    IBOutlet UIImageView *imageBaseRun2;
    
    @public float x;
    @public float y;
    @public float width;
    @public float height;
}
- (void) initiation:( UIViewController* )gaming;
- (void) Draw;
- (void) Update;
@end

NS_ASSUME_NONNULL_END
