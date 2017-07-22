//
//  ViewController.m
//  CloudExampleProject
//
//  Created by Agoni on 2017/4/19.
//  Copyright © 2017年 吴运根. All rights reserved.
//

#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import "SendItemView.h"

@interface ViewController ()

@property (nonatomic, strong) SendItemView *exampleView;

@end

@implementation ViewController {
    NSDictionary *emitterShapeDic;
    NSDictionary *emitterModeDic;
    UIButton *lastShapeBtn;
    UIButton *lastModeBtn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    emitterShapeDic = @{@"kCAEmitterLayerCircle":kCAEmitterLayerCircle
                        ,@"kCAEmitterLayerPoint":kCAEmitterLayerPoint
                        ,@"kCAEmitterLayerLine":kCAEmitterLayerLine
                        ,@"kCAEmitterLayerRectangle":kCAEmitterLayerRectangle
                        ,@"kCAEmitterLayerCuboid":kCAEmitterLayerCuboid
                        ,@"kCAEmitterLayerSphere":kCAEmitterLayerSphere};
    emitterModeDic = @{@"kCAEmitterLayerPoints":kCAEmitterLayerPoints
                       ,@"kCAEmitterLayerOutline":kCAEmitterLayerOutline
                       ,@"kCAEmitterLayerSurface":kCAEmitterLayerSurface
                       ,@"kCAEmitterLayerVolume":kCAEmitterLayerVolume};
    _exampleView = [[SendItemView alloc] initWithFrame:CGRectMake(0, 0, screenW, screenH)];
    _exampleView.backgroundColor = [UIColor colorWithRed:137/255.0 green:207/255.0 blue:240/255.0 alpha:1];
    _exampleView.effectLayer.emitterPosition = CGPointMake(0, 100);
    [_exampleView startAnimation];
    [self.view insertSubview:_exampleView atIndex:0];
    
    
}

#pragma mark - 方法
- (IBAction)emitterShapeAction:(UIButton *)sender {
     //change button state
    lastShapeBtn.selected = !lastShapeBtn.selected;
    sender.selected = !sender.selected;
    lastShapeBtn = sender;
    
    NSString *emitterShapeStr = [NSString stringWithFormat:@"kCAEmitterLayer%@",sender.currentTitle];
    NSLog(@"发射形状：%@",emitterShapeStr);
    _exampleView.effectLayer.emitterShape = emitterShapeDic[emitterShapeStr];//发射源的形状，这个字段规定了发射源的形状
}

- (IBAction)emitterMode:(UIButton *)sender {
    //change button state
    lastModeBtn.selected = !lastModeBtn.selected;
    sender.selected = !sender.selected;
    lastModeBtn = sender;
    
    NSString *emitterModeStr = [NSString stringWithFormat:@"kCAEmitterLayer%@",sender.currentTitle];
    NSLog(@"发射模式：%@",emitterModeStr);
    _exampleView.effectLayer.emitterMode = emitterModeDic[emitterModeStr];//发射模式，这个字段规定了在特定形状上发射的具体形式是什么
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
