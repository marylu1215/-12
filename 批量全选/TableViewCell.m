//
//  TableViewCell.m
//  pod_test
//
//  Created by YY_ZYQ on 2017/6/24.
//  Copyright © 2017年 YY_ZYQ. All rights reserved.
//

#import "TableViewCell.h"
#import <Masonry.h>
#define WIDTH  [UIScreen mainScreen].bounds.size.width

@implementation TableViewCell
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *ID = @"TableViewCell";
    id cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell = [[self alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        
    }
    return cell;
}
//- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        //self.label.backgroundColor = [UIColor redColor];
//        self.backgroundColor = [UIColor yellowColor];
//        self.label.backgroundColor = [UIColor redColor];
//
//        NSLog(@"输出self.frame.size.with:%f",self.frame.size.width);
//        NSLog(@"输出uiscreenwidth:%f",[UIScreen mainScreen].bounds.size.width);
//
//        self.contentView.frame = CGRectMake(0, 0, WIDTH, 40);
//        self.label.frame = CGRectMake(0, 0, WIDTH, 40);
//        [self.contentView addSubview:self.label];
//
//
//
//
//    }
//    return self;
//}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
     
                self.contentView.frame = CGRectMake(0, 0, WIDTH, 40);
                self.label.frame = CGRectMake(0, 0, WIDTH, 40);
        self.label.backgroundColor = [UIColor redColor];
                [self.contentView addSubview:self.label];
        
        _yellowBtn = [[UIButton alloc]init];
        _yellowBtn.frame = CGRectMake(0, 0, WIDTH-60, 40);
       // _yellowBtn.backgroundColor = [UIColor redColor];
        _yellowBtn.backgroundColor = [UIColor yellowColor];
        [_yellowBtn addTarget:self action:@selector(clickyellowBtn:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_yellowBtn];
    }
    return self;
}
-(void)clickyellowBtn:(UIButton *)btn{
    //NSLog(@"点击的是btn的值");
    //typedef void (^collectPopBlock)(UIButton *);
    
    if (self.bottomClick) {
        self.bottomClick(btn);
    }
}
-(UIButton *)yellowBtn{
    if (!_yellowBtn) {
        
    }
    return _yellowBtn;
}
- (UILabel *)label{
    if (!_label) {
        self.label = [[UILabel alloc] init];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:15];
        _label.backgroundColor = [UIColor clearColor];
        
    }
    return _label;
}




//处理选中背景色问题
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    if (!self.editing) {
        return;
    }
    [super setSelected:selected animated:animated];
    
    if (self.editing) {
        self.contentView.backgroundColor = [UIColor clearColor];
        self.backgroundColor = [UIColor clearColor];

        self.label.backgroundColor = [UIColor clearColor];
        
      
    }
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated{
    return;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    //重写此方法，作用为当进入编辑模式时候运行customMultipleChioce方法
    [super setEditing:editing animated:animated];
    if (editing) {
        [self customMultipleChioce];
    }
}
-(void)layoutSubviews
{
    //重写此方法，作用为当cell重新绘制的时候运行customMultipleChioce方法
    [self customMultipleChioce];
    [super layoutSubviews];
}
-(void)customMultipleChioce{
    for (UIControl *control in self.subviews){
        //循环cell的subview
        if ([control isMemberOfClass:NSClassFromString(@"UITableViewCellEditControl")]){
            //找出UITableViewCellEditControl
            for (UIView *view in control.subviews)
            {
                if ([view isKindOfClass: [UIImageView class]]) {
                    //在UITableViewCellEditControl中找到imageView
                    
                    //NSLog(@"更改图片这个方法能运行几次");
                    UIImageView *img=(UIImageView *)view;
                    //这样便可以更改按钮的坐标
                    img.frame = CGRectMake(20, img.frame.origin.y, img.frame.size.width, img.frame.size.height);
                    //NSLog(@"选中更换图片");
                    //更改按钮图片
                    if (self.selected) {
                        
                       // NSLog(@"选中图片");
                        img.image=[UIImage imageNamed:@"折丁未选中"];
                    }else
                    {
                       // NSLog(@"没有选中图片");
                        //  NSLog(@"输出self的值:%@",self);
                        img.image=[UIImage imageNamed:@"收藏选中"];
                    }
                }
            }
        }
    }
}



@end
