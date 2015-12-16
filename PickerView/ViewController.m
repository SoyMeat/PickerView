//
//  ViewController.m
//  PickerView
//
//  Created by Bao on 15/12/14.
//  Copyright © 2015年 Microlink. All rights reserved.
//

#import "ViewController.h"
#import "BzwPicker.h"
@interface ViewController ()<delegate>
{
    BzwPicker *pick;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    pick = [[BzwPicker alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 250)];
    pick.delegatee = self;
    pick.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:pick];
    
    [pick.leftBtn addTarget:self action:@selector(cacleBtn) forControlEvents:UIControlEventTouchUpInside];
    [pick.rightBtn addTarget:self action:@selector(okBtn) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(0, 0, 320, 44);
    [btn setTitle:@"选择" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnDown) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)btnDown
{
    [UIView animateWithDuration:.5f animations:^{
        self.view.backgroundColor = [UIColor grayColor];
        [pick setFrame:CGRectMake(0, self.view.frame.size.height-250, self.view.frame.size.width, 250)];
    }];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [UIView animateWithDuration:.5f animations:^{
        self.view.backgroundColor = [UIColor whiteColor];
        [pick setFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 250)];
    }];
}
//取消
-(void)cacleBtn
{
    [UIView animateWithDuration:.5f animations:^{
        self.view.backgroundColor = [UIColor whiteColor];
        [pick setFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 250)];
    }];
}
//暂时没做其他操作   仅仅是取消
-(void)okBtn
{
    [UIView animateWithDuration:.5f animations:^{
        self.view.backgroundColor = [UIColor whiteColor];
        [pick setFrame:CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 200)];
    }];
}
-(void)didSelete:(NSString *)pro andCity:(NSString *)city andTown:(NSString *)town
{
    NSLog(@"选择的是哪个%@……%@……%@",pro,city,town);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
