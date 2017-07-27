//
//  ViewController.m
//  JDTestRunTime
//
//  Created by judy on 2017/5/22.
//  Copyright © 2017年 judy. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "RunModel.h"
#import "RunTimeObject.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//    [self testPrint];
    
    RunModel *run = [[RunModel alloc] init];
    run.name = @"name";
    run.runName = [[NSMutableString alloc] initWithString:@"runName"];
    
    run.array = @[@"A", @"B", @"C", @(1)];
    NSMutableString *str1 = [[NSMutableString alloc] initWithString:@"A"];
    NSMutableString *str2 = [[NSMutableString alloc] initWithString:@"B"];
    NSMutableString *str3 = [[NSMutableString alloc] initWithString:@"C"];
    run.runArray = [NSMutableArray arrayWithObjects:str1, str2, str3, @(1), nil];
    
    run.dict = @{@"dict" : @"dict"};
    run.runDict = [NSMutableDictionary dictionaryWithDictionary:@{@"hehe" : @"123", @"jjk" : @"kk", @"dict" : @{@"eee" : @"2222", @"dddd" : @"4444"}}];
    
    run.attStr = [[NSAttributedString alloc] initWithString:@"attStr"];
    run.runAttStr = [[NSMutableAttributedString alloc] initWithString:@"runAttStr"];
    
    uint8_t da[5];
    da[0] = 0xff;
    da[1] = 0xad;
    run.data = [NSData dataWithBytes:da length:5];
    
    uint8_t runda[10];
    runda[0] = 0x11;
    runda[1] = 0x12;
    run.runData = [NSMutableData dataWithBytes:runda length:10];
    
    RunModel *cpRun = run.copy;
    cpRun.name = @"change";
    cpRun.runName = [[NSMutableString alloc] initWithString:@"changeName"];
    
    cpRun.array = @[@"A", @"B", @"C", @(2)];
    [cpRun.runArray replaceObjectAtIndex:0 withObject:[[NSMutableString alloc] initWithString:@"F"]];
    
    cpRun.dict = @{@"dict" : @"changeDict"};
    [cpRun.runDict setValue:@{@"eee" : @"333", @"dddd" : @"5555"} forKey:@"dict"];
    
    [cpRun.runAttStr appendAttributedString:[[NSAttributedString alloc] initWithString:@"123"]];
    
    uint8_t dd[5];
    dd[0] = 0x23;
    dd[1] = 0x24;
    
    cpRun.data = [NSData dataWithBytes:dd length:5];
    [cpRun.runData replaceBytesInRange:NSMakeRange(0, 2) withBytes:dd];
    
    NSLog(@"%@", cpRun);
    
    NSLog(@"create branch test");
    NSLog(@"");
    NSLog(@"gengxin");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
