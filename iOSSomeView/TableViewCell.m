//
//  TableViewCell.m
//  iOSSomeView
//
//  Created by yang on 16/8/16.
//  Copyright © 2016年 poplary. All rights reserved.
//
#define Height ([UIScreen mainScreen].bounds.size.height-64)
#import "TableViewCell.h"
@interface TableViewCell(){

    UIImageView *ivShow;
}
@end
@implementation TableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView *titleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Height*0.1)];
        titleView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *userImg = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, titleView.frame.size.height-20, titleView.frame.size.height-20)];
        userImg.image = [UIImage imageNamed:@"background.jpg"];
        CGFloat radius = (titleView.frame.size.height-20)/2;
        userImg.layer.cornerRadius = radius;
        userImg.layer.masksToBounds = YES;
        [titleView addSubview:userImg];
        //title
        UILabel *showTitle = [[UILabel alloc]initWithFrame:CGRectMake(titleView.frame.size.height,10, 100, userImg.frame.size.height/2)];
        showTitle.text = @"小清新";
        [showTitle sizeToFit];
        showTitle.font = [UIFont fontWithName:@"Arial" size:12];
        [self.contentView addSubview:titleView];
        [titleView addSubview:showTitle];
        //时间
        UILabel *timeLab = [[UILabel alloc]initWithFrame:CGRectMake(titleView.frame.size.height, 10+userImg.frame.size.height/2, 100, userImg.frame.size.height/2)];
        timeLab.text = @"1小时以前";
        [timeLab sizeToFit];
        timeLab.font = [UIFont fontWithName:@"Arial" size:10];
        timeLab.textColor  = [UIColor grayColor];
        [titleView addSubview:timeLab];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, titleView.frame.size.height, SCREEN_WIDTH, Height*0.6 )];
        
        [self.contentView addSubview:imageView];
        
        UIView *containerView = [[UIView alloc]initWithFrame:CGRectMake(0, Height*0.7, SCREEN_WIDTH, Height*0.3)];
        
        UILabel *imgTitle = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, containerView.frame.size.height/3)];
        imgTitle.text = @"妹妹";
        [imgTitle sizeToFit];
        [containerView addSubview:imgTitle];
        
        UILabel *labLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 10+containerView.frame.size.height/3, 100, containerView.frame.size.height/3)];
        labLab.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        labLab.layer.cornerRadius = 5;
        labLab.text = @"二次元";
        labLab.layer.masksToBounds = YES;
        [labLab sizeToFit];
        labLab.textAlignment = NSTextAlignmentCenter;
        labLab.font = [UIFont fontWithName:@"Arial" size:12];
        labLab.textColor = [UIColor lightGrayColor];
        [containerView addSubview:labLab];
        
        [self.contentView addSubview:containerView];
        
        ivShow = imageView;
        
    }
    return self;
}
-(void)show:(NSString *)image{

    ivShow.image = [UIImage imageNamed:image];
    //NSLog(@"%@",self.su);
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
