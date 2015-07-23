//
//  ViewController.m
//  WebserviceExample
//
//  Created by api admin on 7/21/15.
//  Copyright (c) 2015 KKB. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "TestClassSuper.h"
#import "JSONModelLib.h"


@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.head.text=[@"Title: " stringByAppendingString:self.object.title];
    self.content.text=self.object.body;
    self.postid.text=[@"Post ID: " stringByAppendingString:[NSString stringWithFormat:@"%d",self.object.id]];
    self.profilepic.image=[UIImage imageNamed:[[NSString stringWithFormat:@"%@",self.object.userId] stringByAppendingString:@".jpg"]];
    self.userid.text=[NSString stringWithFormat:@"User ID: %@",self.object.userId];
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



 
@end