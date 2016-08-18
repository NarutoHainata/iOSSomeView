//
//  SizeTableViewCell.m
//  iOSSomeView
//
//  Created by yang on 16/8/18.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "SizeTableViewCell.h"
@interface SizeTableViewCell(){

    UILabel *_lab;
    UIImageView *_imageView;
}
@end
@implementation SizeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
        _imageView.image = [UIImage imageNamed:@"img2.jpg"];
        [_imageView sizeToFit];
        [self addSubview:_imageView];
    }
    return self;
}
- (void)layoutSubviews{

    
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
