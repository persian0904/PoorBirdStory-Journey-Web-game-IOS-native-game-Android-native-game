//
//  live.h
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/25/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface live : UIImageView{
    IBOutlet UIImageView *liveImg1;
    IBOutlet UIImageView *liveImg2;
    IBOutlet UIImageView *liveImg3;
    
    int liveCounter;
    NSArray *imagesArrays;
    
    NSObject *this_game;
}
- (void) initiation :( NSObject* )gaming ;
- (void) Draw;
- (void) Update;

@end

NS_ASSUME_NONNULL_END
