//
//  background.h
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/20/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface background : UIView{
    IBOutlet UIImageView *bgImageBase;
    IBOutlet UIImageView *bgImageRun;
    
    UIViewController *this_game;
    
    float x;
    float y;
    float width;
    float height;
}
- (void) initiation:( UIViewController* )gaming;
- (void) Draw;
- (void) Update;
@end

NS_ASSUME_NONNULL_END
