//
//  CenterCollectionViewController.m
//  搜图必备
//
//  Created by tareba on 16/1/18.
//  Copyright © 2016年 tanada. All rights reserved.
//

#import "CenterCollectionViewController.h"
#import "CollectionViewCell.h"
#import "STPhotoBrowserController.h"
#import "STConfig.h"
@interface CenterCollectionViewController ()<STPhotoBrowserDelegate>

@end

@implementation CenterCollectionViewController

static NSString * const reuseIdentifier = @"Cell";
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@",self.str);
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@",self.str);
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.collectionView.backgroundColor = [UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
   [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    //self.collectionView.layoutMargins = UIEdgeInsetsMake(5, 5, 5, 5);
     // Do any additional setup after loading the view.
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma  mark - photoBrower代理方法
- (UIImage*)photoBrowser:(STPhotoBrowserController *)browser placeholderImageForIndex:(NSInteger)index {
    return [UIImage imageNamed:@"08359.jpg"];
}
- (NSURL*)photoBrowser:(STPhotoBrowserController *)browser highQualityImageURLForIndex:(NSInteger)index {
    NSURL *url  = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"08359" ofType:@"jpg"]];
    return url ;
}
#pragma  mark - event Response 事件相应
- (void)ClickButton:(UIButton*)button {
    STPhotoBrowserController *browerVc  = [[STPhotoBrowserController alloc]init];
    browerVc.sourceImagesContainerView = self.collectionView;
    browerVc.countImage = 12;
    browerVc.currentPage = (int)button.tag;
    browerVc.delegate = self;
    [browerVc show];
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of items
    return 12;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell.button addTarget:self action:@selector(ClickButton:) forControlEvents:UIControlEventTouchUpInside];
    cell.button.tag = indexPath.row;
    // Configure the cell
    
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>


// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

#pragma mark - UIdddd
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.view.bounds.size.width-20)/2+2.5, (self.view.bounds.size.width-20)/2);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(5, 5,
                            5, 5);
}
//UICollectionView被选中时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell * cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
   // cell.backgroundColor = [UIColor whiteColor];
}
//返回这个UICollectionView是否可以被选择
-(BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}



/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return YES;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
    NSLog(@"%s",__func__);
}
*/
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout  minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 5;
}
@end
