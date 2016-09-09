//
//  ImageCutViewController.m
//  iOSSomeView
//
//  Created by yang on 16/9/8.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "ImageCutViewController.h"

@interface ImageCutViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIImageView *cutImageView;
@property (nonatomic, strong) UIImageView *imageView3;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ImageCutViewController

-(UIImageView *)cutImageView{
    
    if (!_cutImageView) {
        _cutImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _cutImageView.layer.borderColor = [UIColor whiteColor].CGColor;
        _cutImageView.layer.borderWidth = 5;
        _cutImageView.image = [UIImage imageNamed:@""];
        _cutImageView.userInteractionEnabled = YES;
    }
    return _cutImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(moveImageV:)];
    pan.delegate = self;
    [self.cutImageView addGestureRecognizer:pan];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
    imageView.contentMode = UIViewContentModeCenter;
    imageView.image = [UIImage imageNamed:@"img2.jpg"];
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    self.imageView = imageView;
    
    
    UIButton *cutBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
    [cutBtn setTitle:@"裁剪" forState:UIControlStateNormal];
    [cutBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cutBtn addTarget:self action:@selector(cutClcik) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBarBtn = [[UIBarButtonItem alloc]initWithCustomView:cutBtn];
    self.navigationItem.rightBarButtonItem = rightBarBtn;
    
    UIImageView *imageView3 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    
    [self.view addSubview:imageView3];
    self.imageView3 = imageView3;

}
//压缩图片
//- (UIImage *)image:(UIImage*)image scaledToSize:(CGSize)newSize
//{
//    // Create a graphics image context
//    UIGraphicsBeginImageContext(newSize);
//    // Tell the old image to draw in this new context, with the desired
//    // new size
//    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
//    // Get the new image from the context
//    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//    // End the context
//    UIGraphicsEndImageContext();
//    // Return the new image.
//    return newImage;
//}
- (void)cutClcik{
    
    [self.imageView addSubview:self.cutImageView];
    
}
//裁剪图片
- (UIImage *)cutImage:(UIImage*)image cutFrame:(CGRect)rect
{
    
    CGSize newSize;
    CGImageRef imageRef = nil;
    
//    if ((image.size.width / image.size.height) < (_headerView.bgImgView.size.width / _headerView.bgImgView.size.height)) {
//        newSize.width = image.size.width;
//        newSize.height = image.size.width * _headerView.bgImgView.size.height / _headerView.bgImgView.size.width;
    
    imageRef  = CGImageCreateWithImageInRect([image CGImage],rect);
    
    return [UIImage imageWithCGImage:imageRef];
}
- (void)moveImageV:(UIPanGestureRecognizer *)paramSender{
    
    CGPoint point = [paramSender translationInView:self.imageView];
    NSLog(@"X:%f;Y:%f",point.x,point.y);
    
    paramSender.view.center = CGPointMake(paramSender.view.center.x + point.x, paramSender.view.center.y + point.y);
    
    [paramSender setTranslation:CGPointMake(0, 0) inView:self.imageView];
    
    NSLog(@"%f,%f",paramSender.view.center.x,paramSender.view.center.y);
    
    CGRect rect = CGRectMake(paramSender.view.center.x-50, paramSender.view.center.y-50, 100, 100);
    self.imageView3.image = [self cutImage:[UIImage imageNamed:@"img2.jpg"] cutFrame:rect];
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
