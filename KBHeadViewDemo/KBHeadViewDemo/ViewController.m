//
//  ViewController.m
//  KBHeadViewDemo
//
//  Created by kangbing on 15/11/1.
//  Copyright © 2015年 kangbing. All rights reserved.
//

#import "ViewController.h"
#import "KBHeadViewController.h"
#import "KBNavViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}
- (IBAction)nextClick:(id)sender {
    
    
    KBHeadViewController *headVC = [[KBHeadViewController alloc]init];
   
    [self.navigationController pushViewController:headVC animated:YES];
    
   
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
