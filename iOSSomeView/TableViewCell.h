//
//  TableViewCell.h
//  iOSSomeView
//
//  Created by yang on 16/8/16.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) NSArray *imgArr;

-(void)show:(NSString *)image;
@end
