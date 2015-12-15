//
//  BzwPicker.h
//  PickerView
//
//  Created by Bao on 15/12/14.
//  Copyright © 2015年 Microlink. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol delegate <NSObject>

-(void)didSelete:(NSString *)pro andCity:(NSString *)city andTown:(NSString *)town;

@end


@interface BzwPicker : UIView<UIPickerViewDataSource,UIPickerViewDelegate>


@property(nonatomic,weak)id<delegate>delegatee;

@property (strong,nonatomic)UIPickerView *pick;

@property (strong, nonatomic) NSDictionary *pickerDic;//获取文件里的字典
@property (strong, nonatomic) NSArray *provinceArray;//省、市
@property (strong, nonatomic) NSArray *cityArray;
@property (strong, nonatomic) NSArray *townArray;
@property (strong, nonatomic) NSArray *selectedArray;//





@property (strong,nonatomic)UIButton *leftBtn;//取消
@property (strong,nonatomic)UIButton *rightBtn;
@end
