//
//  TestClassSuper.h
//  WebserviceExample
//
//  Created by api admin on 7/22/15.
//  Copyright (c) 2015 KKB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TestClass.h"
#import "JSONModel.h"

@interface TestClassSuper : JSONModel

@property (nonatomic) NSArray<TestClass>* posts;

@end
