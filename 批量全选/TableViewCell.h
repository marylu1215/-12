//
//  TableViewCell.h
//  pod_test
//
//  Created by YY_ZYQ on 2017/6/24.
//  Copyright © 2017年 YY_ZYQ. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^collectPopBlock)(UIButton *);
@interface TableViewCell : UITableViewCell
@property (nonatomic ,strong) UILabel *label;
+(instancetype)cellWithTableView:(UITableView *)tableView;

@property(nonatomic,strong)UIButton *quanxuanBtn;

@property(nonatomic,strong)UIButton *yellowBtn;

@property(copy,nonatomic)collectPopBlock bottomClick;
//customMultipleChioce
-(void)customMultipleChioce;
@end
