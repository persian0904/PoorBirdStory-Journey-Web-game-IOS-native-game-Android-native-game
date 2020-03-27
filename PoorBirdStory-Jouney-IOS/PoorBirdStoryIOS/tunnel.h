//
//  tunnel.h
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/21/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface tunnel : UIImageView {
    IBOutlet UIImageView *tunnelAbove;
    IBOutlet UIImageView *tunnelBottom;
    
    NSObject *this_game;
    
    @public int xTop;
    int yTop;
    int yTopMin;
    int xBottom;
    int yBottom;
    int pipeWidth;
    int pipeHeight;
    
    CGFloat hRange;
}
- (void) initiation:( UIViewController* )gaming;
- (void) Draw;
- (void) Update;
@end

NS_ASSUME_NONNULL_END

