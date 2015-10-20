//
//  ViewController.m
//  Demo_POP
//
//  Created by 孙继刚 on 15/10/19.
//  Copyright © 2015年 Madordie. All rights reserved.
//

#import "ViewController.h"
#import "UIView+KTJAnimation.h"
#import "UIButton+KTJAnimation.h"
#import <POP.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *fButton;
@property (weak, nonatomic) IBOutlet UIButton *alButton;

@end

@implementation ViewController


#pragma mark - < *** ViewController    生命周期   👇 ***>

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _fButton.ktj_autoEnlarge = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - < *** ViewController    响应事件   👇 ***>

#pragma mark - < *** ViewController      代理     👇 ***>

#pragma mark - < *** ViewController    私有方法    👇 ***>
- (IBAction)buttonAction:(UIButton *)sender {
    [_alButton ktj_shakeUpDown:10];
}

#pragma mark - < *** ViewController getter/setter 👇 ***>

- (UIColor *)bgColor {
    self.view.tag = !(self.view.tag%2);
    return self.view.tag?[UIColor greenColor]:[UIColor whiteColor];
}

@end
