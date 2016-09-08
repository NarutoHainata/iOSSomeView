//
//  ProgressViewController.m
//  iOSSomeView
//
//  Created by yang on 16/9/8.
//  Copyright © 2016年 poplary. All rights reserved.
//
/****
 0 - 100   伍长
 100 - 200 卒长
 200 - 500
 500 - 1000
 1000 - 2000
 2000 - 3000
 3000 - 5000
 5000 - 10000
 10000 - 30000
 30000 - 50000
 50000+
 ****/
#define Width self.view.frame.size.width
#import "ProgressViewController.h"

@interface ProgressViewController (){
    
    NSInteger jifen;
    NSInteger shengjifen;
}

@property (nonatomic, strong) UIProgressView *pView;
@property (nonatomic, strong) UILabel *firLab;
@property (nonatomic, strong) UILabel *lastLab;
@property (nonatomic, strong) UILabel *show;
@end

@implementation ProgressViewController

-(UIProgressView *)pView{
    
    if (!_pView) {
        _pView = [[UIProgressView alloc] initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-100, 10)];
        _pView.backgroundColor = [UIColor greenColor];
    }
    return _pView;
}

- (UILabel *)firLab{
    
    if (!_firLab) {
        _firLab = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 100, 30)];
        _firLab.font = [UIFont fontWithName:@"Arial" size:12];
    }
    return _firLab;
}
-(UILabel *)lastLab{
    
    if (!_lastLab) {
        _lastLab = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width-140, 100, 100, 30)];
        _lastLab.font = [UIFont fontWithName:@"Arial" size:12];
        _lastLab.textAlignment = NSTextAlignmentRight;
    }
    return _lastLab;
}
- (UILabel *)show{
    
    if (!_show) {
        _show = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
        _show.font = [UIFont fontWithName:@"Arial" size:12];
        _show.backgroundColor = [UIColor yellowColor];
        _show.text = [NSString stringWithFormat:@"%d",jifen];
    }
    return _show;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.pView];
    [self.view addSubview:self.firLab];
    [self.view addSubview:self.lastLab];
    
    
    jifen = arc4random()%50000;
    
    if (0< jifen && jifen < 100) {
    
        self.firLab.text = @"...";
        self.lastLab.text = @"100 伍长";
        
        self.pView.progress = (float)jifen/100;
       
        
        self.show.center = CGPointMake((Width-100)*jifen/100+80, 80);
        
        [self.show sizeToFit];
        [self.view addSubview:self.show];
        
    }
    else if (100 <= jifen && jifen < 200){
        
        self.firLab.text = @"100 伍长";
        self.lastLab.text = @"200 卒长";
        self.pView.progress = (float)jifen/200;
        
        self.show.center = CGPointMake((Width-100)*jifen/200+80, 80);
        [self.show sizeToFit];
        [self.view addSubview:self.show];
    }
    else if (200 <= jifen && jifen < 500){
        
        self.firLab.text = @"200 卒长";
        self.lastLab.text = @"500 百夫长";
        self.pView.progress = (float)jifen/500;
        
        self.show.center = CGPointMake((Width-100)*jifen/500+80, 80);
        [self.show sizeToFit];
        [self.view addSubview:self.show];
    }
    else if (500 <= jifen && jifen < 1000){
        
        self.firLab.text = @"500 百夫长";
        self.lastLab.text = @"1000 都头";
        self.pView.progress = (float)jifen/1000;
        
        self.show.center = CGPointMake((Width-100)*jifen/1000+80, 80);
        [self.show sizeToFit];
        [self.view addSubview:self.show];
    }
    else if (1000 <= jifen && jifen < 2000){
        
        self.firLab.text = @"1000 都头";
        self.lastLab.text = @"2000 营侯";
        self.pView.progress = (float)jifen/2000;
        
        self.show.center = CGPointMake((Width-100)*jifen/2000+80, 80);
        [self.show sizeToFit];
        [self.view addSubview:self.show];
        
    }
    else if (2000 <= jifen && jifen < 3000){
        
        self.firLab.text = @"2000 营侯";
        self.lastLab.text = @"3000 旅帅";
        self.pView.progress = (float)jifen/3000;
        
        self.show.center = CGPointMake((Width-100)*jifen/3000+80, 80);
        [self.show sizeToFit];
        [self.view addSubview:self.show];
    }
    else if (3000 <= jifen && jifen < 5000){
        
        self.firLab.text = @"3000 旅帅";
        self.lastLab.text = @"5000 师帅";
        self.pView.progress = (float)jifen/5000;
        
        self.show.center = CGPointMake((Width-100)*jifen/5000+80, 80);
        [self.show sizeToFit];
        [self.view addSubview:self.show];
    }
    else if (5000 <= jifen && jifen < 10000){
        
        self.firLab.text = @"5000 师帅";
        self.lastLab.text = @"10000 大将军";
        self.pView.progress = (float)jifen/10000;
        
        self.show.center = CGPointMake((Width-100)*jifen/10000+80, 80);
        [self.show sizeToFit];
        [self.view addSubview:self.show];
    }
    else if (10000 <= jifen && jifen < 30000){
        
        self.firLab.text = @"10000 大将军";
        self.lastLab.text = @"30000 大司马";
        self.pView.progress = (float)jifen/30000;
        
        self.show.center = CGPointMake((Width-100)*jifen/30000+80, 80);
        [self.show sizeToFit];
        [self.view addSubview:self.show];
    }
    else if (30000 <= jifen && jifen < 50000){
        
        self.firLab.text = @"30000 大司马";
        self.lastLab.text = @"50000 伍帅";
        self.pView.progress = (float)jifen/5000;
        
        self.show.center = CGPointMake((Width-100)*jifen/50000+80, 80);
        [self.show sizeToFit];
        [self.view addSubview:self.show];
    }
    else if (50000 <= jifen){
        
        self.firLab.text = @"50000 伍帅";
        self.lastLab.text = @"...";
        self.pView.progress = 1;
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
