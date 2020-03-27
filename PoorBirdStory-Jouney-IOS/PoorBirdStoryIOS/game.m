//
//  game.m
//  PoorBirdStoryIOS
//
//  Created by NghiemTuan on 3/18/20.
//  Copyright © 2020 NghiemTuan. All rights reserved.
//

#import "game.h"

@interface game ()

@end

@implementation game

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    NSLog(@"viewDidLoad");
    //    [bg initiation];
    //    [bg setImage:[UIImage imageNamed: @"bird1.png"]];
    //    NSLog(@"bounds.size.height 1= %f",[UIScreen mainScreen].bounds.size.width);
    //    NSLog(@"bounds.size.height 1= %f",[UIScreen mainScreen].bounds.size.height);
    
    //  Initiation game
    [self Initiation];
    //  draw game
    [self Draw];
    
    //listen mouse action
    [self ListenMouse];
    
    [self draw_live];
    
    GameMovement =[NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(Looper) userInfo:nil repeats:YES];
}


-(void) draw_live {
    
    
}

-(void)ListenMouse{
    
}
-(void)Looper{
    [self Update];
    [self Draw];
}

- (void) Initiation;{
    start_game = 0;
    gameOverFlg = 0;
    noOfLive = 3;
    [backgroundViewer initiation:self];
    [birdViewer initiation: self];
    [tunnelAbove initiation:self];
    [baseViewer initiation:self];
    [liveImgViewer1 initiation:self];
    [scoreLB initiation:self];
    [textInfo initiation:self];
}
- (void) Update;{
    [backgroundViewer Update];
    [birdViewer Update];
    [tunnelAbove Update];
    [baseViewer Update];
    [liveImgViewer1 Update];
    [scoreLB Update];
    [textInfo Update];
}
- (void) Draw;{
    [backgroundViewer Draw];
    [birdViewer Draw];
    [tunnelAbove Draw];
    [baseViewer Draw];
    [liveImgViewer1 Draw];
    [scoreLB Draw];
    [textInfo Draw];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (gameOverFlg == 0) {
        [birdViewer Birdflap];
    } else{
        //choi tiep
        if (noOfLive > 0) {
            start_game = 1;
            gameOverFlg = 0;
            [birdViewer initiation: self];
            [tunnelAbove initiation:self];
        }else{
            start_game = 0;
            gameOverFlg = 0;
            noOfLive = 3;
            [birdViewer initiation: self];
            [liveImgViewer1 initiation:self];
            [tunnelAbove initiation:self];
            [scoreLB initiation:self];
        }
    }
}

- (void)checkGameStatus;{

}
/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
