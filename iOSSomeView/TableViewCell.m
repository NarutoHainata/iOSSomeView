//
//  TableViewCell.m
//  iOSSomeView
//
//  Created by yang on 16/8/16.
//  Copyright © 2016年 poplary. All rights reserved.
//
#define Height [UIScreen mainScreen].bounds.size.height-64
#import "TableViewCell.h"
@interface TableViewCell(){

    UIImageView *ivShow;
}
@end
@implementation TableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 200)];
        //imageView.image = [UIImage imageNamed:@"img1.jpg"];
        [self.contentView addSubview:imageView];
        ivShow = imageView;
    }
    return self;
}
-(void)show:(NSString *)image{

    ivShow.image = [UIImage imageNamed:image];
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
