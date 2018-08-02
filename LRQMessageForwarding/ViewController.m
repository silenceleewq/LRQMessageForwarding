//
//  ViewController.m
//  LRQMessageForwarding
//
//  Created by Maskkk on 2018/8/2.
//  Copyright © 2018 lirenqiang. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *p = [Person new];
    [p test];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
