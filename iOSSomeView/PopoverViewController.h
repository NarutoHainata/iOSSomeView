//
//  Popover.h
//  presentingViewController
//
//  Created by yiban on 15/8/17.
//  Copyright (c) 2015年 yiban. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopoverViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *colorArray;

@end
