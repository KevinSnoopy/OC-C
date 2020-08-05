//
//  ViewController.m
//  OC&C++
//
//  Created by Kevin on 2020/8/4.
//  Copyright © 2020 Kevin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"获取随机素数===%d",[ViewController getPrime]);
    NSMutableArray *array = [NSMutableArray array];
    NSLog(@"分解大数=====%@",[self getPrimes:[[NSString stringWithFormat:@"%ld",arc4random()%10000000000] intValue] Array:array]);
    
    NSLog(@"素数的个数======%ld",[self getAllPrimes:1000].count);
}

/**
 获取素数
 */
+ (int)getPrime {
    int n,k;
    n = arc4random()%100;
    NSLog(@"----%d",n);
    k = [ViewController prime:n];
    return k;
}

+ (int)prime:(int)n {
    for (int i = 2; i < n; i ++) {
        if (n%i == 0) {
            n = [ViewController prime:n-1];
        }
    }
    return n;
}

/**
 分解大数
 */
- (NSArray *)getPrimes:(int)gNum Array:(NSMutableArray *)array {
    NSLog(@"大数=====%d",gNum);
    if ([self isPrime:gNum]) {
        [array addObject:@(gNum)];
        return array;
    }
    for (int i = 2; i < gNum; i ++) {
        if ([self isPrime:i]) {
            if (gNum%i == 0) {
                [array addObject:@(i)];
                [self getPrimes:gNum/i Array:array];
                break;
            }
        }
    }
    return array;
}

/**
 获取素数
 */
- (NSArray *)getAllPrimes:(int)gNum {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 2; i < gNum; i ++) {
        if ([self isPrime:i]) {
            [array addObject:@(i)];
        }
    }
    return array;
}

- (BOOL)isPrime:(int)num {
    for (int i = 2; i < num; i ++) {
        if (num%i == 0) {
            return NO;
        }
    }
    return YES;
}

@end
