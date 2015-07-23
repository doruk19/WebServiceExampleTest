//
//  TestClass.h
//  WebserviceExample
//
//  Created by api admin on 7/21/15.
//  Copyright (c) 2015 KKB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@protocol TestClass @end

@interface TestClass : JSONModel

@property (nonatomic) NSString* userId;
@property (nonatomic) int id;
@property (nonatomic) NSString* title;
@property (nonatomic) NSString* body;


@end

