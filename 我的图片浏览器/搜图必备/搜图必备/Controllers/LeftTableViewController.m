//
//  LeftTableViewController.m
//  搜图必备
//
//  Created by tareba on 16/1/18.
//  Copyright © 2016年 tanada. All rights reserved.
//

#import "LeftTableViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "CenterCollectionViewController.h"
@interface LeftTableViewController ()
@property (nonatomic,strong) NSArray *modelArray;
@end

@implementation LeftTableViewController
static NSString *identifier = @"Cell";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"常见分类";
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.modelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self.modelArray[indexPath.row];
    
    return cell;
}
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CenterCollectionViewController * o= [[CenterCollectionViewController alloc]init];
    UINavigationController *mainNavi = [[UINavigationController alloc]initWithRootViewController:o];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
                             o.str =cell.textLabel.text;
    [self.mm_drawerController setCenterViewController:mainNavi withCloseAnimation:YES completion:nil];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSArray *)modelArray {
	if(_modelArray == nil) {
        _modelArray = @[@"美女",@"时尚",@"摄影",@"美食",@"明星",@"搞笑",@"艺术",@"萌控",@"表情",@"动漫",@"型男"];
	}
	return _modelArray;
}

@end
