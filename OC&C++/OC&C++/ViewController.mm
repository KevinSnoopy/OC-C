//
//  ViewController.m
//  OC&C++
//
//  Created by Kevin on 2020/8/4.
//  Copyright © 2020 Kevin. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import <objc/objc.h>
#import <os/lock.h>

@interface ViewController () <UITextViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    Person *person1 = [Person shareInstance];
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        Person *person2 = [Person shareInstance];
//    });
    
//    NSLog(@"获取随机素数===%d",[ViewController getPrime]);
//    NSMutableArray *array = [NSMutableArray array];
//    NSLog(@"分解大数=====%@",[self getPrimes:[[NSString stringWithFormat:@"%ld",arc4random()%10000000000] intValue] Array:array]);
//
//    NSLog(@"素数的个数======%ld",[self getAllPrimes:1000].count);
//    os_unfair_lock unfairLock;
//    os_unfair_lock_lock(&unfairLock);
//    os_unfair_lock_unlock(&unfairLock);
//
//    NSCondition *lock = [[NSCondition alloc]init];
//    [lock lock];//上锁
//    [lock wait];//等待-阻塞线程
//    [lock waitUntilDate:[NSDate date]];//等到某时-阻塞线程
//    [lock signal];//唤醒一个等待的线程
//    [lock broadcast];//唤醒在等待的线程
//    [lock unlock];//解锁
//
//    NSRecursiveLock *lock1 = [[NSRecursiveLock alloc]init];
//    [lock1 lock];
//    [lock1 tryLock];
//    [lock1 lockBeforeDate:[NSDate date]];
//    [lock1 unlock];
    
    //[ViewController dispatch_semaphore];
    
    [ViewController bytesCount];
}

/**
 数据类型占有字节数
 */
+ (void)bytesCount {
    NSString *str = @"test";
    char a = [str UTF8String][0];
    NSLog(@"char=====%p======%p",a,&a);
    const char *b = [str UTF8String];
    NSLog(@"char *=====%p======%p",b,&b);
    BOOL c = [str boolValue];
    NSLog(@"BOOL=====%p======%p",c,&c);
    short d;
    NSLog(@"short=====%p======%p",d,&d);
    int e = 5;
    NSLog(@"int=====%p======%p",e,&e);
    unsigned int f = 5;
    NSLog(@"unsigned int=====%p======%p",f,&f);
    NSInteger g;
    NSLog(@"NSInteger=====%p======%p",g,&g);
    long h;
    NSLog(@"long=====%p======%p",h,&h);
    long long i;
    NSLog(@"long long=====%p======%p",i,&i);
    unsigned long long j;
    NSLog(@"unsigned long long=====%p======%p",j,&j);
    float k;
    NSLog(@"float=====%p======%p",k,&k);
    double l;
    NSLog(@"double=====%p======%p",l,&l);
    CGFloat m;
    NSLog(@"CGFloat=====%p======%p",m,&m);
    CGSize n;
    NSLog(@"CGSize=====%p======%p",n,&n);
    CGRect o;
    NSLog(@"CGRect=====%p======%p",o,&o);
    UIView *view = [UIView new];
    NSLog(@"UIView=====%p======%p",view,&view);
}

/**
 gcd信号量
 */
+ (void)dispatch_semaphore {
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    for (int i = 0; i < 100; i ++) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
            NSLog(@"信号量=======%@------%d",[NSThread currentThread],i);
            dispatch_semaphore_signal(sema);
        });
    }
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
