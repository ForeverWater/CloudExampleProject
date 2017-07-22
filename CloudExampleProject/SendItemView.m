//
//  SendIternView.m
//  动画集合
//
//  Created by Agoni on 2017/4/18.
//  Copyright © 2017年 吴运根. All rights reserved.
//

#import "SendItemView.h"

@implementation SendItemView {
    UIImageView *imageV;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _effectLayer = [CAEmitterLayer layer];
        _effectLayer.position = CGPointMake(-30, 30);//发射位置
        _effectLayer.emitterSize = self.frame.size;//发射源的尺寸大小，其实这个emitterSize结合position构建了发射源的位置及大小的矩形区域rect.该size不是粒子的size
        
        _effectLayer.emitterShape = kCAEmitterLayerPoint;//发射源的形状，这个字段规定了发射源的形状
        _effectLayer.emitterMode = kCAEmitterLayerOutline;//发射模式，这个字段规定了在特定形状上发射的具体形式是什么
        _effectLayer.renderMode =  kCAEmitterLayerUnordered;//发射器渲染模式
        
        _effectCell = [CAEmitterCell emitterCell];
        _effectCell.contents =(__bridge id _Nullable)([UIImage imageNamed:@"cloud"].CGImage);//设置发射的粒子样式，这里选择了一张图片
        _effectCell.birthRate = 1;//每秒生产粒子的个数
        _effectCell.lifetime = 40;//生存时间，这个代表对象能够存活的时间
        _effectCell.lifetimeRange = 2;//生存时间浮动，这个代表生存时间会在这个数字内浮动
        _effectCell.velocity = 8;//运动速度
        _effectCell.velocityRange = 7;//运动速度的浮动数字
//        _effectCell.yAcceleration = 30;//模仿地球的重力加速度，适用例如：下雨、下雪
        _effectCell.xAcceleration = 15;
        _effectLayer.emitterCells = @[_effectCell];
        
    }
    return self;
}

- (void)startAnimation {
    [self.layer addSublayer:_effectLayer];
}

- (void)stopAnimation {
    [_effectLayer removeFromSuperlayer];
}

@end
