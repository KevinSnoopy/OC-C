//
//  Person.m
//  OC&C++
//
//  Created by Kevin on 2020/8/4.
//  Copyright © 2020 Kevin. All rights reserved.
//

#import "Person.h"

@interface Person ()

@property (nonatomic, assign) float height;

@end

@implementation Person

/**
 staic静态变量指针不会变，但是指向的内存地址可以变；
 在同一个线程内使用__block修饰的变量指针不会变，但是不同线程的指针会变；
 当onceToken=0时可以进入block，在block内部时onceToken会变的比0大的值，具体值没找到规律，在出block后onceToken=-1；
 */
+ (instancetype)shareInstance {
    static Person *person;
    static dispatch_once_t onceToken;
    NSLog(@"token======%ld====%p=====%p=====%@",onceToken,&person,person,[NSThread currentThread]);
    dispatch_once(&onceToken, ^{
        NSLog(@"token======%ld====%p=====%p",onceToken,&person,person);
        person = [[Person alloc]init];
    });
    NSLog(@"token======%ld====%p=====%p",onceToken,&person,person);
    onceToken = 0;
    return person;
}

- (void)test {
    Person *aPerson = [[Person alloc]init];
    aPerson.age = 18;
}

- (BOOL)isChild {
    return _age >= 18;
}

- (BOOL)isNormalHeight {
    return _height >= 170;
}

@end
