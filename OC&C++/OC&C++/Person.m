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
