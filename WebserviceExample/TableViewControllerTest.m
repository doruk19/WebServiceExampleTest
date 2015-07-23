//
//  TableViewControllerTest.m
//  SampleTable
//
//  Created by api admin on 7/22/15.
//  Copyright (c) 2015 KKB. All rights reserved.
//

#import "TableViewControllerTest.h"
#import <AFNetworking.h>
#import "TestClassSuper.h"
#import "JSONModelLib.h"
#import "ViewController.h"
#import "CustomCell.h"

@interface TableViewControllerTest ()



@end

@implementation TableViewControllerTest



NSArray* tableData;
ViewController* destination;
id objectToPassed;




- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self accessSource];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableData count];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString* tableIdentifier = @"customCell";
    
    CustomCell* cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:tableIdentifier];
    
    if(cell==nil){
        NSArray* nib=[[NSBundle mainBundle] loadNibNamed:@"customCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
        
    }
    //cell.textLabel.text= [NSString stringWithFormat:@"%d",[[tableData objectAtIndex:indexPath.row] id] ];
    cell.post.text=[[tableData objectAtIndexedSubscript:indexPath.row] title];
    cell.poster.text=[NSString stringWithFormat:@"User ID: %@",[[tableData objectAtIndexedSubscript:indexPath.row] userId]];
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)accessSource{
   CGRect screenBound = [[UIScreen mainScreen] bounds];
    UIActivityIndicatorView * vi = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [vi setFrame:CGRectMake(screenBound.size.width/2.0-50,200, 100, 100)];
    [self.view addSubview:vi];
   [vi startAnimating];
    AFHTTPRequestOperationManager *testMng =[AFHTTPRequestOperationManager manager];

    [testMng GET:@"http://jsonplaceholder.typicode.com/posts"  parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        tableData = [TestClass arrayOfModelsFromDictionaries:responseObject];
        [vi stopAnimating];
        [self.tableView reloadData];
       
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    }];
    
};
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   ViewController* destination= [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Content"];
   objectToPassed=[tableData objectAtIndexedSubscript:indexPath.row];
   destination.object=objectToPassed;
    [self.navigationController pushViewController:destination animated:true];
   // [self performSegueWithIdentifier:@"detailSegue" sender:self];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    NSLog(@"ewdew");
//}
//- (void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
//    NSLog(@"aaa");
//}
//- (BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender {
//    NSLog(@"qqq");
//    return true;
//}

@end
