//
//  KBHeadViewController.m
//  KBHeadViewDemo
//
//  Created by kangbing on 15/11/1.
//  Copyright © 2015年 kangbing. All rights reserved.
//

#import "KBHeadViewController.h"
#import "YYWebImage.h"
#import "UIView+Extension.h"


#define kHeadViewHeight 210


@interface KBHeadViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation KBHeadViewController{

    UIView      *_headView;
    UIImageView *_headimageView;
    UIView      *_lineView;
    UITableView *_tableView;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
  
    
    
    [self loadTableView];
    [self loadHeadView];
    
    
    
}
- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
    // 取消自动调整滚动视图间距 
    self.automaticallyAdjustsScrollViewInsets = NO;
    

}

#pragma mark 顶部视图
- (void)loadHeadView{

    
    _headimageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, kHeadViewHeight)];
    _headimageView.contentMode = UIViewContentModeScaleAspectFill;
    // 设置图像裁切
    _headimageView.clipsToBounds = YES;

    [self.view addSubview:_headimageView];

    NSURL *url = [NSURL URLWithString:@"http://www.xiaosiuber.com/uploads/allimg/151130/1448875685527555.jpg"];
    //  利用YYWebImage异步加载图像,并且带有网络指示器
    [_headimageView yy_setImageWithURL:url options:YYWebImageOptionShowNetworkActivity];
    


}

#pragma mark 准备tableView
- (void)loadTableView{
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView = tableView;
    _tableView.contentInset = UIEdgeInsetsMake(kHeadViewHeight, 0, 0, 0);
    tableView.scrollIndicatorInsets = tableView.contentInset;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];

}




#pragma mark dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 80;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    
    cell.textLabel.text = @(indexPath.row).stringValue;
    
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat offset = scrollView.contentOffset.y + scrollView.contentInset.top;
    
    NSLog(@"offset%f",offset); // 如果offset<0 放大,  否则上移

    
    if (offset <= 0) {

        _headimageView.height = kHeadViewHeight - offset;
        _headimageView.y = 0;

    }else{
    
        // 整体移动
//        _headimageView.height = kHeadViewHeight;
        _headimageView.y = -offset;
        
        
    }
    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
