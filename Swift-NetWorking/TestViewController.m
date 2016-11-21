//
//  TestViewController.m
//  Swift-NetWorking
//
//  Created by FlyElephant on 16/11/19.
//  Copyright © 2016年 FlyElephant. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int  (^addBlock)(int a,int b)=^(int a,int b){
        return a+b;
    };
    
    NSLog(@"addBlock的结果:%d",addBlock(100,300));
    
    typedef NSInteger (^testBlock)(NSInteger a,NSInteger b);
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
