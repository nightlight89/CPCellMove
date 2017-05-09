# CPCellMove
cell 移动

/**将外部数据源数组传入，以便在移动cell数据发生改变时进行修改重排*/
- (NSArray *)originalArrayDataForTableView:(CPMoveCellTableView *)tableView;
/**将修改重排后的数组传入，以便外部更新数据源*/
- (void)tableView:(CPMoveCellTableView *)tableView newArrayDataForDataSource:(NSArray *)newArray;
/**选中的cell准备好可以移动的时候*/
- (void)tableView:(CPMoveCellTableView *)tableView cellReadyToMoveAtIndexPath:(NSIndexPath *)indexPath;
/**选中的cell正在移动，变换位置，手势尚未松开*/
- (void)cellIsMovingInTableView:(CPMoveCellTableView *)tableView;
/**选中的cell完成移动，手势已松开*/
- (void)cellDidEndMovingInTableView:(CPMoveCellTableView *)tableView;
