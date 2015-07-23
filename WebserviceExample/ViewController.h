//
//  ViewController.h
//  WebserviceExample
//
//  Created by api admin on 7/21/15.
//  Copyright (c) 2015 KKB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TestClass.h"
@interface ViewController : UIViewController

@property (strong,nonatomic) IBOutlet UILabel *head;
@property (strong,nonatomic) IBOutlet UILabel *content;
@property (strong,nonatomic) TestClass* object;
@property (strong,nonatomic) IBOutlet UILabel *postid;
@property (strong,nonatomic) IBOutlet UILabel *userid;
@property (strong,nonatomic) IBOutlet UIImageView* profilepic;

@end
