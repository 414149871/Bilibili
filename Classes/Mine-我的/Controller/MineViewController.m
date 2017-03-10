//
//  MineViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/16.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "MineViewController.h"
#import "MineCollectionViewCell.h"
#import "MineRegisterAndLoginView.h"
#import "LoginAndRegisterViewController.h"
#import "HistoryRecordViewController.h"

#define CellIdentifier @"CellIdentifier"
#define Header @"Header"
#define Footer @"Footer"
@interface MineViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,MineRegisterAndLoginViewDelegate>

@property (nonatomic,strong)UICollectionView  *collectionView;
@property (nonatomic,strong)NSMutableArray  *dataSource;
@end

@implementation MineViewController

- (UICollectionView *)collectionView{
    
    if(!_collectionView){
        
        CGFloat y = 60 + 64;
        CGFloat itemWidth = (ScreenWidth)/4;
        CGFloat itemHeight = itemWidth;
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];         //创建layout(此处创建的是流水布局)
        flowLayout.minimumLineSpacing = 0;          //行距
        flowLayout.minimumInteritemSpacing = 0;     //列距
        flowLayout.itemSize = CGSizeMake(itemWidth, itemHeight); //设置每个item 的大小
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical; //设置 UICollectionView 的滑动方向
        
        //设置 item 的上左下右的边距大小
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);

        //根据layout创建collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, y, ScreenWidth, ScreenHeight-y-49+2) collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = RLCommonBgColor;
        _collectionView.layer.cornerRadius = 5.0;
        _collectionView.layer.masksToBounds = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
//        _collectionView.contentSize = CGSizeMake(0, itemHeight*5+40);
        //当界面内容不超过界面大小时不会滑动，加上面这句话就能滑动了
//        _collectionView.alwaysBounceVertical = YES;

        
        //注册单元格
        [self.collectionView registerNib:[UINib nibWithNibName:@"MineCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:CellIdentifier];
        
        //注册头部区域
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:Header];
    
        flowLayout.headerReferenceSize = CGSizeMake(ScreenWidth, itemHeight/2);
        
        //注册尾部区域
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:Footer];
        flowLayout.footerReferenceSize = CGSizeMake(ScreenWidth, 10);
    }
    return _collectionView;
}

//数据源
- (NSMutableArray *)dataSource{
    
    if(!_dataSource){
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"MineCollectionViewCellInfoList" ofType:@"plist"];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _dataSource = [NSMutableArray arrayWithArray:array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置右边导航栏按钮
    [self setUpRightBarButton];
    //设置注册登录按钮
    [self setRegisterAndLoginLayout];
    [self.view addSubview:self.collectionView];
}

//设置右边导航栏按钮
- (void)setUpRightBarButton{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"mine_settings"] style:UIBarButtonItemStylePlain target:self action:@selector(settingAction:)];
}

//设置注册登录按钮
- (void)setRegisterAndLoginLayout{
    MineRegisterAndLoginView *view = [[MineRegisterAndLoginView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, 30)];
    view.delegate = self;
    [self.view addSubview:view];
}

#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray *array = self.dataSource[section];
    return array.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    MineCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.dictionary = [self.dataSource[indexPath.section] objectAtIndex:indexPath.row];
    return cell;
}

//设置头部和尾部区域
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (kind == UICollectionElementKindSectionHeader) {
        //设置头部区域
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:Header forIndexPath:indexPath];
        headerView.backgroundColor = [UIColor whiteColor];

        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, ScreenWidth, headerView.frame.size.height)];
        label.font = [UIFont systemFontOfSize:14];
        [headerView addSubview:label];
        if (indexPath.section == 0) {
            label.text = @"个人中心";
        }
        else{
            label.text = @"我的消息";
        }
        return headerView;
    }
    else{
        //设置尾部区域
        UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:Footer forIndexPath:indexPath];
        footerView.backgroundColor = RLColor(241, 241, 241);
        return footerView;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        switch (indexPath.row) {
            case 1: //历史记录
            {
                self.hidesBottomBarWhenPushed = YES;
                HistoryRecordViewController *historyRecordVC = [[HistoryRecordViewController alloc] init];
                [self.navigationController pushViewController:historyRecordVC animated:YES];
                self.hidesBottomBarWhenPushed = NO;
            }
                break;
                
            default:
                break;
        }
    }
}


#pragma mark scrollViewDelegate
//设置collectionView上下拉时的背景颜色
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y >1) {
        self.collectionView.backgroundColor = RLColor(241, 241, 241);
    }
    else if (scrollView.contentOffset.y <= 0){
        self.collectionView.backgroundColor = RLCommonBgColor;
    }
}

#pragma mark MineRegisterAndLoginViewDelegate
//注册按钮响应事件
- (void)registerBtnAction:(UIButton *)sender{
    RLLog(@"注册");
}

//登录按钮响应事件
- (void)loginBtnAction:(UIButton *)sender{
    
    LoginAndRegisterViewController *loginAndRegisterVC = [[LoginAndRegisterViewController alloc] init];
    UINavigationController *loginNav = [[UINavigationController alloc] initWithRootViewController:loginAndRegisterVC];
    [self presentViewController:loginNav animated:YES completion:^{
        
    }];
}

//设置按钮响应时间
- (void)settingAction:(UIBarButtonItem *)sender{
    RLLog(@"设置");
}

@end






































































