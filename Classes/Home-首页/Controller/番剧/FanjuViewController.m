//
//  FanjuViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/23.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "FanjuViewController.h"
#import "AFNetWorkRequest.h"
#import "FJHDataModels.h"
#import "XinFanLianZaiHomeCollectionReusableView.h"
#import "TuiJianCommentHeaderCollectionReusableView.h"
#import "TuiJianDongHuaFooterCollectionReusableView.h"
#import "XinFanLianZaiCollectionViewCell.h"

#define scrollPicHeight  ScreenWidth / 3.1
#define FirstCellIdentifier @"FirstCellIdentifier"
#define XinFanLianZaiHomeIdentifier @"XinFanLianZaiHomeIdentifier"
#define TuiJianCommentHeaderIdentifier @"TuiJianCommentHeaderIdentifier"
#define TuiJianDongHuaFooterIdentifier @"TuiJianDongHuaFooterIdentifier"


@interface FanjuViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView  *collectionView;
@property (nonatomic,strong)NSMutableArray  *dataSource;
@property (nonatomic,strong)NSMutableArray  *adMArray;  //顶部滚动图片数据源
@end

@implementation FanjuViewController
- (UICollectionView *)collectionView{
    
    if(!_collectionView){
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 10, 10);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-49) collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = RLColor(241, 241, 241);
        _collectionView.showsVerticalScrollIndicator = NO;
        
        //注册单元格
//        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:FirstCellIdentifier];
     
        [_collectionView registerNib:[UINib nibWithNibName:@"XinFanLianZaiCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:FirstCellIdentifier];
        
        //注册头部区域
        [_collectionView registerNib:[UINib nibWithNibName:@"XinFanLianZaiHomeCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:XinFanLianZaiHomeIdentifier];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"TuiJianCommentHeaderCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:TuiJianCommentHeaderIdentifier];
        
        //注册尾部区域
        [_collectionView registerNib:[UINib nibWithNibName:@"TuiJianDongHuaFooterCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:TuiJianDongHuaFooterIdentifier];
    }
    return _collectionView;
}

//数据源
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

//顶部滚动图片数据源
- (NSMutableArray *)adMArray{
    if(!_adMArray){
        _adMArray = [NSMutableArray array];
    }
    return _adMArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RLColor(241, 241, 241);
    [self.view addSubview:self.collectionView];
    //网络请求
    [self netWorkRequest];
}

#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSMutableArray *mArray = self.dataSource[section];
    return mArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    XinFanLianZaiCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FirstCellIdentifier forIndexPath:indexPath];

    NSMutableArray *mArray = self.dataSource[indexPath.section];
    if (indexPath.section == 0) {
        FJHSerializing *serializing = mArray[indexPath.row];
        cell.serializing = serializing;
    }
    else if (indexPath.section == 1){
        FJHList *list = mArray[indexPath.row];
        cell.list = list;
    }
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if (kind == UICollectionElementKindSectionHeader) {
    
        if (indexPath.section == 0) {
        
            XinFanLianZaiHomeCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:XinFanLianZaiHomeIdentifier forIndexPath:indexPath];
            headerView.adMArray = self.adMArray;
            return headerView;
        }
        else{
            TuiJianCommentHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:TuiJianCommentHeaderIdentifier forIndexPath:indexPath];
            headerView.fanjuHomeIndexPath = indexPath;
            return headerView;
        }
    }
    else{
        
        TuiJianDongHuaFooterCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:TuiJianDongHuaFooterIdentifier forIndexPath:indexPath];
        footerView.adMArray = self.adMArray;
        return footerView;
    }
    return nil;
}

#pragma mark  UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(ScreenWidth,  scrollPicHeight +10+60+5+40+40);
    }
    return CGSizeMake(ScreenWidth, 40);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    CGFloat height = scrollPicHeight * 3/4;
    if (section == 0) {
        return CGSizeMake(ScreenWidth, height);
    }
    return CGSizeZero;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    CGFloat width = (ScreenWidth - 40)/3;
    CGFloat height = width*4/3 +5+ 30 + 21;
    return CGSizeMake(width, height);
}

#pragma mark  网络请求
- (void)netWorkRequest{

    NSString *urlString = @"http://bangumi.bilibili.com/api/app_index_page_v4?build=3940&device=phone&mobi_app=iphone&platform=ios";
    [AFNetWorkRequest getRequestWithUrl:urlString result:^(id result) {
        
        FJHFANJUHOME *model = [FJHFANJUHOME modelObjectWithDictionary:result];
        FJHResult *fjhResult = model.result;
        FJHAd *ad = fjhResult.ad;
        
        //顶部滚动图片数据源
        [self.adMArray addObject:ad];
        
        //新番连载数据
        NSMutableArray *xinFanLianZaiMArray = [NSMutableArray array];
        NSArray *serializingArray = fjhResult.serializing;
        for (int i = 0; i < serializingArray.count; i++) {
            
            FJHSerializing *serializing = serializingArray[i];
            [xinFanLianZaiMArray addObject:serializing];
        }
        
        //7月新番
        NSMutableArray *qiYueXinFanMArray = [NSMutableArray array];
        FJHPrevious *previous = fjhResult.previous;
        NSArray *listArray = previous.list;
        for (int i = 0; i < listArray.count; i++) {
            
            FJHList *list = listArray[i];
            [qiYueXinFanMArray addObject:list];
        }
        
        [self.dataSource addObject:xinFanLianZaiMArray];
        [self.dataSource addObject:qiYueXinFanMArray];
        
        [self.collectionView reloadData];
    }];
}

@end











































































