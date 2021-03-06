//
//  ViewController.m
//  iOSSomeView
//
//  Created by yang on 16/7/25.
//  Copyright © 2016年 poplary. All rights reserved.
//

#import "ViewController.h"
#import "RecommendViewController.h"
#import "SizeToFitViewController.h"
#import "ProgressViewController.h"
#import "ImageCutViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableArray *saveVCArr;
@property(nonatomic,strong)NSMutableArray *saveCellTtile;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"主页";
    //self.navigationController.navigationBar.hidden = YES;
    [self.navigationController.navigationBar setBarTintColor:RGBA(145, 250, 250, 0.5)];
    //[self.navigationController.navigationBar.subviews objectAtIndex:<#(NSUInteger)#>];
    //self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    self.edgesForExtendedLayout = UIRectEdgeTop;
    // Do any additional setup after loading the view, typically from a nib.
    UIAlertViewController *alertViewC = [[UIAlertViewController alloc]init];
    CollectionViewController *collectionViewC = [[CollectionViewController alloc]init];
    MenuBtnViewController *menuBtnViewC = [[MenuBtnViewController alloc]init];
    TextFieldAndKeyboard *textFieldKeyboard = [[TextFieldAndKeyboard alloc]init];
    ScrollMenuBtnViewController *scrollMenuBtnVC = [[ScrollMenuBtnViewController alloc]init];
    RecommendViewController *recomVC = [[RecommendViewController alloc]init];
    SizeToFitViewController *sizeVC = [[SizeToFitViewController alloc]init];
    ProgressViewController *pVC = [[ProgressViewController alloc]init];
    
    ImageCutViewController *iVC = [[ImageCutViewController alloc]init];
    self.saveVCArr = [[NSMutableArray alloc]initWithObjects:alertViewC,collectionViewC,menuBtnViewC,textFieldKeyboard,scrollMenuBtnVC,recomVC,sizeVC,pVC,iVC, nil];
    
    self.saveCellTtile = [[NSMutableArray alloc]initWithObjects:@"UIAlertController",@"CollectionViewController",@"MenuBtnViewController",@"TextFieldAndKeyboard",@"ScrollMenuBtnViewController",@"RecommendViewController",@"SizeToFitViewController",@"ProgressViewController",@"ImageCutViewController", nil];
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.backgroundColor = RGBA(245, 245, 245, 1);
    tableView.backgroundView = [[UIView alloc]initWithFrame:tableView.frame];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:tableView.frame];
    imageView.image = [UIImage imageNamed:@"mainbg.jpeg"];
    [tableView.backgroundView addSubview:imageView];
    tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.01f)];
    tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.saveVCArr.count;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.saveCellTtile objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.navigationController pushViewController:[self.saveVCArr objectAtIndex:indexPath.row] animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
