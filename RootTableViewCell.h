//
//  RootTableViewCell.h
//  TextViewNestedInTableDemo
//
//  Created by sunydea on 14/6/24.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTableViewCell : UITableViewCell

@property (nonatomic,weak) IBOutlet  UITableView *subTableView;
@end
