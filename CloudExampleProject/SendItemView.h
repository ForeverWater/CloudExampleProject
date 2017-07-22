//
//  SendIternView.h
//  动画集合
//
//  Created by Agoni on 2017/4/18.
//  Copyright © 2017年 吴运根. All rights reserved.
//  

#import <UIKit/UIKit.h>

@interface SendItemView : UIView

@property (nonatomic, strong) CAEmitterCell *effectCell;
@property (nonatomic, strong) CAEmitterLayer *effectLayer;

- (void)startAnimation;
- (void)stopAnimation;

@end
