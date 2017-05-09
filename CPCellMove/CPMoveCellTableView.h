//
//  CPMoveCellTableView.h
//  FYDHouTai
//
//  Created by 王程鹏 on 2017/5/5.
//  Copyright © 2017年 baling. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CPMoveCellTableView;
@protocol CPMoveCellTableViewDataSource <UITableViewDataSource>

@required
/**将外部数据源数组传入，以便在移动cell数据发生改变时进行修改重排*/
- (NSArray *)originalArrayDataForTableView:(CPMoveCellTableView *)tableView;

@end

@protocol CPMoveCellTableViewDelegate <UITableViewDelegate>

@required
/**将修改重排后的数组传入，以便外部更新数据源*/
- (void)tableView:(CPMoveCellTableView *)tableView newArrayDataForDataSource:(NSArray *)newArray;
@optional
/**选中的cell准备好可以移动的时候*/
- (void)tableView:(CPMoveCellTableView *)tableView cellReadyToMoveAtIndexPath:(NSIndexPath *)indexPath;
/**选中的cell正在移动，变换位置，手势尚未松开*/
- (void)cellIsMovingInTableView:(CPMoveCellTableView *)tableView;
/**选中的cell完成移动，手势已松开*/
- (void)cellDidEndMovingInTableView:(CPMoveCellTableView *)tableView;

@end

@interface CPMoveCellTableView : UITableView


@property (nonatomic, assign) id<CPMoveCellTableViewDataSource> dataSource;
@property (nonatomic, assign) id<CPMoveCellTableViewDelegate> delegate;

@end
