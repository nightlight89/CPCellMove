//
//  ViewController.m
//  CPCellMove
//
//  Created by 王程鹏 on 2017/5/8.
//  Copyright © 2017年 王程鹏. All rights reserved.
//

#import "ViewController.h"
#import "CPMoveCellTableView.h"

@interface ViewController ()<CPMoveCellTableViewDelegate,CPMoveCellTableViewDataSource>
{
    NSArray *_dataArray;
}

@property (nonatomic,strong) CPMoveCellTableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _dataArray=@[@[@"刘德华",@"张学友",@"黎明",@"周润发"],@[@"周星驰",@"梁朝伟",@"张国荣"],@[@"巩俐",@"章子怡",@"周迅",@"梅艳芳",@"朱茵"]];
    [self.view addSubview:self.tableView];
}

- (CPMoveCellTableView *)tableView
{
    if (!_tableView)
    {
        _tableView=[[CPMoveCellTableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        
        _tableView.rowHeight=50;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray[section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text=_dataArray[indexPath.section][indexPath.row];
    
    return cell;
}

//必选
- (NSArray *)originalArrayDataForTableView:(CPMoveCellTableView *)tableView{
    return _dataArray;
}

- (void)tableView:(CPMoveCellTableView *)tableView newArrayDataForDataSource:(NSArray *)newArray{
    _dataArray = [NSMutableArray arrayWithArray:newArray];
}

//可选
- (void)tableView:(CPMoveCellTableView *)tableView cellReadyToMoveAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"准备移动！");
}
- (void)cellIsMovingInTableView:(CPMoveCellTableView *)tableView
{
    NSLog(@"正在移动！");
}
- (void)cellDidEndMovingInTableView:(CPMoveCellTableView *)tableView
{
    NSLog(@"移动结束！");
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
