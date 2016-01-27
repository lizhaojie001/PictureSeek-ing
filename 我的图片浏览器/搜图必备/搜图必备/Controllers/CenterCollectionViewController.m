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
#import "customView.h"
@interface CenterCollectionViewController ()<STPhotoBrowserDelegate,UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic,strong) UICollectionView *collectionView;
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
    self.title = self.str;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    
   [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CELL"];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [self setupNaviItem];
}
- (void)setupNaviItem {
    UIBarButtonItem *rightItem= [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightItem ;
    customView *view=    [[customView alloc]initWithFrame:CGRectMake(0, 0, 35, 35)];
    view.backgroundColor = [UIColor clearColor];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:view];
    
 
    
    self.navigationItem.leftBarButtonItem = leftItem;
   
}
#pragma  mark - photoBrower代理方法
- (UIImage*)photoBrowser:(STPhotoBrowserController *)browser placeholderImageForIndex:(NSInteger)index {
    return [UIImage imageNamed:@"08359.png"];
}
- (NSURL*)photoBrowser:(STPhotoBrowserController *)browser highQualityImageURLForIndex:(NSInteger)index {
    NSURL *url  = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"08359" ofType:@"png"]];
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
#pragma  mark - 懒加载
- (NSString *) str {
    if(_str == nil) {
        _str = @"鲜花";
    }
    return _str;
}
- (UICollectionView *)collectionView {
	if(_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        
		_collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        [self.view addSubview:_collectionView];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
	}
	return _collectionView;
}

@end
