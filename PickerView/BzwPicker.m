//
//  BzwPicker.m
//  PickerView
//
//  Created by Bao on 15/12/14.
//  Copyright © 2015年 Microlink. All rights reserved.
//

#import "BzwPicker.h"

@implementation BzwPicker


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self makeui];
    }
    return self;
}
-(void)makeui
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 20)];
    view.backgroundColor = [UIColor redColor];
    [self addSubview:view];
    
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.leftBtn.frame = CGRectMake(0, 0, 40, 20);
    [self.leftBtn setTitle:@"取消" forState:UIControlStateNormal];
    [view addSubview:self.leftBtn];
    
    
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.rightBtn.frame = CGRectMake(view.frame.size.width-40,0, 40, 20);
    [self.rightBtn setTitle:@"确定" forState:UIControlStateNormal];
    [view addSubview:self.rightBtn];
    
    self.pick = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 20, self.frame.size.width, self.frame.size.height - 20)];
    self.pick.delegate = self;
    self.pick.dataSource = self;
    self.pick.showsSelectionIndicator=YES;
    [self addSubview:self.pick];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Address" ofType:@"plist"];
    self.pickerDic = [[NSDictionary alloc] initWithContentsOfFile:path];

    //省  市
    self.provinceArray = [self.pickerDic allKeys];    

    //最开始选中的第一个省市
    self.selectedArray = [self.pickerDic objectForKey:[[self.pickerDic allKeys] objectAtIndex:0]];
  
    
    if (self.selectedArray.count > 0) {
        self.cityArray = [[self.selectedArray objectAtIndex:0] allKeys];
    }
    
    if (self.cityArray.count > 0) {
        self.townArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:0]];
    }

    
}
//返回显示的列数
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
//返回当前列显示的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.provinceArray.count;
    } else if (component == 1) {
        return self.cityArray.count;
    } else {
        return self.townArray.count;
    }

}

#pragma mark Picker Delegate Methods

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return [self.provinceArray objectAtIndex:row];
    } else if (component == 1) {
        return [self.cityArray objectAtIndex:row];
    } else {
        return [self.townArray objectAtIndex:row];
    }
}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        return 110;
    } else if (component == 1) {
        return 100;
    } else {
        return 110;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0)
    {
        self.selectedArray = [self.pickerDic objectForKey:[self.provinceArray objectAtIndex:row]];
        if (self.selectedArray.count > 0) {
            self.cityArray = [[self.selectedArray objectAtIndex:0] allKeys];
        }
        else
        {
            self.cityArray = nil;
        }
        if (self.cityArray.count > 0)
        {
            self.townArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:0]];
        }
        else
        {
            self.townArray = nil;
        }
    }
    [pickerView selectedRowInComponent:1];
    [pickerView reloadComponent:1];
    [pickerView selectedRowInComponent:2];
    
    if (component == 1)
    {
        if (self.selectedArray.count > 0 && self.cityArray.count > 0)
        {
            self.townArray = [[self.selectedArray objectAtIndex:0] objectForKey:[self.cityArray objectAtIndex:row]];
        }
        else
        {
            self.townArray = nil;
        }
        [pickerView selectRow:1 inComponent:2 animated:YES];
    }
    
    
    [pickerView reloadComponent:2];
    
    
    [self.delegatee didSelete:[self.provinceArray objectAtIndex:[pickerView selectedRowInComponent:0]] andCity:[self.cityArray objectAtIndex:[pickerView selectedRowInComponent:1]] andTown:[self.townArray objectAtIndex:[pickerView selectedRowInComponent:2]]];
   // NSLog(@"%@5++%@++++%@",[self.provinceArray objectAtIndex:[pickerView selectedRowInComponent:0]],[self.cityArray objectAtIndex:[pickerView selectedRowInComponent:1]],[self.townArray objectAtIndex:[pickerView selectedRowInComponent:2]]);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
