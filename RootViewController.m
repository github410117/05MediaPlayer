//
//  RootViewController.m
//  05MediaPlayer
//
//  Created by etcxm on 16/6/27.
//  Copyright © 2016年 中软国际. All rights reserved.
//

#import "RootViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
#import <MediaPlayer/MediaPlayer.h>


@interface RootViewController ()
- (IBAction)playAction:(id)sender;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
//    1、AVPlayer  播放视频
    
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"王菲^陈奕迅-因为爱情-国语[mtvxz.cn]" ofType:@"mp4"];
//    
//    NSURL *url = [NSURL fileURLWithPath:path];
//    
//    AVPlayer *player = [[AVPlayer alloc] initWithURL:url];
//    
//    
////    Layer 与 UIView
//    AVPlayerLayer *playerlayer = [AVPlayerLayer playerLayerWithPlayer:player];
//    
////    设置AVPlayerLayer的大小
//    playerlayer.frame = CGRectMake(10, 50, 375-20, 200);
//    
////    playerlayer.backgroundColor = (__bridge CGColorRef _Nullable)([UIColor redColor]);
//    
//    [self.view.layer addSublayer:playerlayer];
//    
//    
//    [player play];
   
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)playAction:(id)sender {
    

    NSString *path = [[NSBundle mainBundle] pathForResource:@"王菲^陈奕迅-因为爱情-国语[mtvxz.cn]" ofType:@"mp4"];
    
    NSURL *url = [NSURL fileURLWithPath:path];
    
    
//    ios9 -----AVPlayerViewController
    
//    AVPlayerItem
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:url];
    
//    通过 AVPlayer  配置信息
    AVPlayer *player = [AVPlayer playerWithPlayerItem:item];
    
    AVPlayerViewController *avPlayerViewCtr = [[AVPlayerViewController alloc] init];
    avPlayerViewCtr.player = player;
    [player play];
//    设置音量
    player.volume =  0.8;
    
//    设置播放的时间
    [player seekToTime:CMTimeMakeWithSeconds(60, 1)];
//    当前时间
    Float64 floatTime = CMTimeGetSeconds(player.currentTime);
    NSLog(@"floatTime = %0.2f",floatTime);
    
    
//    总时长
    Float64 alltime =  CMTimeGetSeconds([item asset].duration);
    
    NSLog(@"alltime = %0.2f",alltime);
    
    
    [self presentViewController:avPlayerViewCtr animated:YES completion:^{
        
    }];
    
    
    
    
    
    //    ios8以下
//    MPMoviePlayerViewController *mpMovie = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
//    
//    [self presentViewController:mpMovie animated:YES completion:^{
//        
//    }];
    

    
}
@end
