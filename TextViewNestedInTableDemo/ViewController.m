//
//  ViewController.m
//  TextViewNestedInTableDemo
//
//  Created by sunydea on 14/6/24.
//  Copyright (c) 2014年 sunydea. All rights reserved.
//

#import "ViewController.h"
#import "RootTableViewCell.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView* rootable;
@property (nonatomic, strong) UITableView* subTable;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.rootable = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, 320, 400)];
    self.rootable.delegate = self;
    self.rootable.dataSource = self;
    [self.rootable registerNib:[UINib nibWithNibName:@"RootTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:_rootable];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _rootable) {
        return 10;
    } else {
        return 3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _rootable) {
        return 200;
    } else
        return 20;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView == _rootable) {
        RootTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        //if (!cell) {
            //cell = [[RootTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.subTableView.delegate = self;
            cell.subTableView.dataSource = self;
            //[cell.subTableView reloadData];
        //}

        //[cell.contentView addSubview:_subTable];
        return cell;
    
    }else {
        UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
        }
        
        UITextView* textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 200, 40)];
        textView.text = @"if (tableView == _rootable) {if (tableView == _rootable) {if (tableView == _rootable) {";
        textView.userInteractionEnabled = NO;
        [cell.contentView addSubview:textView];
        return cell;
    }
    
    
}

@end
