//
//  Person.h
//  OC&C++
//
//  Created by Kevin on 2020/8/4.
//  Copyright © 2020 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (nonatomic, assign) int age;
- (BOOL)isChild;

@end

NS_ASSUME_NONNULL_END
