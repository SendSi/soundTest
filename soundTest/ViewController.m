//
//  ViewController.m
//  soundTest
//
//  Created by scuplt on 16/10/26.
//  Copyright © 2016年 scuplt. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (nonatomic,strong) AVAudioRecorder *recorder;
@end

@implementation ViewController


- (IBAction)clickPlaySound {
    
    
}

- (IBAction)clickStart {
    [self.recorder record];
}

-(AVAudioRecorder *)recorder{
    if(_recorder ==nil){
            //1.创建沙盒路径
            NSString *path=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
            //拼接字符串,音频文件
            NSString *filePath=[path stringByAppendingPathComponent:@"12.caf"];//音频就是caf格式的
            NSURL *url=[NSURL fileURLWithPath:filePath];
            NSDictionary *settingRecorder=@{
                                            AVEncoderAudioQualityKey:[NSNumber numberWithInteger:AVAudioQualityLow],//质量
                                            AVEncoderBitRateKey:[NSNumber numberWithInteger:16],//位数
                                            AVSampleRateKey:[NSNumber numberWithFloat:8000],//简单率
                                            AVNumberOfChannelsKey:[NSNumber numberWithInteger:2]//通道
                                            };
        _recorder=[[AVAudioRecorder alloc] initWithURL:url settings:settingRecorder error:nil];
    }
    return _recorder;
}

- (IBAction)clickEnd {
    [self.recorder stop];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}
@end
