//
//  ZhiBoViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/23.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "ZhiBoViewController.h"
#import "TuiJianZhuoBoCollectionReusableView.h"
#import "AFNetWorkRequest.h"
#import "ZhiBoHomeDataModels.h"
#import "ZBHDataModels.h"
#import "TuiJianCommentHeaderCollectionReusableView.h"
#import "ZhiBoLastFooterCollectionReusableView.h"
#import "HomeTuiJianZhiBoCollectionViewCell.h"
#import "ZhiBoShowViewController.h"

#define FirstCellIdentifier @"FirstCellIdentifier"
#define ZhiBoHomeOtherCellIdentifier @"ZhiBoHomeOtherCellIdentifier"

#define TuiJianZhiBoHeader @"TuiJianZhiBoHeader"
#define CommentHeaderIdentifier @"CommentHeaderIdentifier"
#define LastFooterIdentifier @"LastFooterIdentifier"

#define scrollPicHeight  ScreenWidth / 3.1

@interface ZhiBoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView  *collectionView;
@property (nonatomic,strong)NSMutableArray  *bannerTopImageMArray;  //顶部滚动图片数据源
@property (nonatomic,strong)NSMutableArray  *tuiJianZhuoBoMArray;   //推荐主播数据
@property (nonatomic,strong)NSMutableArray  *firstSectionCellDataSource;    //推荐直播处理后数据
@property (nonatomic,strong)NSMutableArray  *partitionsMArray;  //个分区数据
@end

@implementation ZhiBoViewController

- (UICollectionView *)collectionView{
    
    if(!_collectionView){
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.minimumLineSpacing = 10;
        flowLayout.minimumInteritemSpacing = 10;
        
        CGFloat itemWidth = (ScreenWidth - 30)/2;
        flowLayout.itemSize = CGSizeMake(itemWidth, itemWidth);
        
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-64-49) collectionViewLayout:flowLayout];
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        _collectionView.backgroundColor = RLColor(241, 241, 241);
        _collectionView.showsVerticalScrollIndicator = NO;
        
        //注册单元格
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:FirstCellIdentifier];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"HomeTuiJianZhiBoCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:ZhiBoHomeOtherCellIdentifier];
        
        //注册头部区域
        [_collectionView registerNib:[UINib nibWithNibName:@"TuiJianZhuoBoCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:TuiJianZhiBoHeader];
        
        [_collectionView registerNib:[UINib nibWithNibName:@"TuiJianCommentHeaderCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CommentHeaderIdentifier];
        //通过代理设置header高度
        
        //注册尾部区域
        [_collectionView registerNib:[UINib nibWithNibName:@"ZhiBoLastFooterCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:LastFooterIdentifier];
        //通过代理设置footer高度
    }
    return _collectionView;
}

//顶部滚动图片数据源
- (NSMutableArray *)bannerTopImageMArray{
    if(!_bannerTopImageMArray){
        _bannerTopImageMArray = [NSMutableArray array];
    }
    return _bannerTopImageMArray;
}
//推荐主播数据
- (NSMutableArray *)tuiJianZhuoBoMArray{
    if(!_tuiJianZhuoBoMArray){
        _tuiJianZhuoBoMArray = [NSMutableArray array];
    }
    return _tuiJianZhuoBoMArray;
}

//个分区数据
- (NSMutableArray *)partitionsMArray{
    if(!_partitionsMArray){
        _partitionsMArray = [NSMutableArray array];
    }
    return _partitionsMArray;
}

//推荐直播处理后数据
- (NSMutableArray *)firstSectionCellDataSource{
    
    if(!_firstSectionCellDataSource){
        _firstSectionCellDataSource = [NSMutableArray array];
    }
    return _firstSectionCellDataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.collectionView];
    //网络请求
    [self NetWorkRequest];
}

#pragma mark    UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        
        if (self.tuiJianZhuoBoMArray.count == 0) {
            return 0;
        }
        
        ZBHRecommendData *recomendData = self.tuiJianZhuoBoMArray[0];
        
        //设置推荐直播数据
        NSMutableArray *tuiJianZhuoBoLivesMArray = [NSMutableArray array];
        NSArray *livesArray = recomendData.lives;
        for (int i = 0; i < livesArray.count; i++) {
            
            ZBHLives *lives = livesArray[i];
            [tuiJianZhuoBoLivesMArray addObject:lives];
        }
        
        //设置推荐直播banner数据
        NSMutableArray *tuiJianZhuoBoBanner_dataMArray = [NSMutableArray array];
        
        NSArray *bannerDataArray = recomendData.bannerData;
        for (int i = 0; i <bannerDataArray.count; i++) {
            
            ZBHBannerData *bannerData = bannerDataArray[i];
            [tuiJianZhuoBoBanner_dataMArray addObject:bannerData];
        }
        
        return tuiJianZhuoBoLivesMArray.count + tuiJianZhuoBoBanner_dataMArray.count;
    }
    else{
        if (self.partitionsMArray.count != 0) {
            return 4;
        }
        return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HomeTuiJianZhiBoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ZhiBoHomeOtherCellIdentifier forIndexPath:indexPath];
    
    switch (indexPath.section) {
        case 0:     //第一个分区
        {
            ZBHRecommendData *recommendData = self.tuiJianZhuoBoMArray[0];
            NSArray *recommendDataArray = recommendData.bannerData;
            if (recommendDataArray.count == 1) {    //根据banner的个数来
                
                if (indexPath.row == 6) {
                    ZBHBannerData *banner = self.firstSectionCellDataSource[indexPath.row];
                    cell.zbhBannerData = banner;
                }
                else{
                    ZBHLives *lives = self.firstSectionCellDataSource[indexPath.row];
                    cell.zbhLives = lives;
                }
            }
            else{
                if (indexPath.row == 0 && indexPath.row == 7) {
                    ZBHBannerData *banner = self.firstSectionCellDataSource[indexPath.row];
                    cell.zbhBannerData = banner;
                }
                else{
                    ZBHLives *lives = self.firstSectionCellDataSource[indexPath.row];
                    cell.zbhLives = lives;
                }
            }
            cell.firstSectionCellDataSource = self.firstSectionCellDataSource;
            cell.firstSectionCellIndexPath = indexPath;
        }
            break;
        default:    //其他各分区
        {
            NRDPartitions *partitions = self.partitionsMArray[indexPath.section-1];
            NSArray *array = partitions.lives;
            NRDLives *lives = array[indexPath.row];
            cell.lives = lives;
            cell.livesIndexPath = indexPath;
        }
            break;
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    if (kind == UICollectionElementKindSectionHeader) {
    
        if (indexPath.section == 0) {
            
            TuiJianZhuoBoCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:TuiJianZhiBoHeader forIndexPath:indexPath];
            
            headerView.bannerTopImageMArray = self.bannerTopImageMArray;
            
            if (self.tuiJianZhuoBoMArray.count > 0) {
                headerView.recommendData = self.tuiJianZhuoBoMArray[0];
            }
            return headerView;
        }
        else{
            TuiJianCommentHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CommentHeaderIdentifier forIndexPath:indexPath];
            
            if (self.partitionsMArray.count > 0) {
                NRDPartitions *patitions = self.partitionsMArray[indexPath.section-1];
                headerView.partitions = patitions;
            }
            headerView.tuijianHomeIndexPath = indexPath;
            return headerView;
        }
    }
    else{
        if (indexPath.section == 9) {
            ZhiBoLastFooterCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:LastFooterIdentifier forIndexPath:indexPath];
            return footerView;
        }
    }
    return nil;
}

#pragma mark UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    ZhiBoShowViewController *zhiBoShowVC = [[ZhiBoShowViewController alloc] initWithNibName:@"ZhiBoShowViewController" bundle:[NSBundle mainBundle]];
    
    //数据处理传值
    switch (indexPath.section) {
        case 0:     //第一个分区
        {
            ZBHRecommendData *recommendData = self.tuiJianZhuoBoMArray[0];
            NSArray *recommendDataArray = recommendData.bannerData;
            if (recommendDataArray.count == 1) {    //根据banner的个数来
                
                if (indexPath.row == 6) {
                    ZBHBannerData *banner = self.firstSectionCellDataSource[indexPath.row];
                    zhiBoShowVC.ZBHBanner = banner;
                    zhiBoShowVC.roomId = banner.roomId;
                    zhiBoShowVC.playurl = banner.playurl;
                }
                else{
                    ZBHLives *lives = self.firstSectionCellDataSource[indexPath.row];
                    zhiBoShowVC.ZBHLives = lives;
                    zhiBoShowVC.roomId = lives.roomId;
                    zhiBoShowVC.playurl = lives.playurl;
                }
            }
            else{
                if (indexPath.row == 0 && indexPath.row == 7) {
                    ZBHBannerData *banner = self.firstSectionCellDataSource[indexPath.row];
                    zhiBoShowVC.ZBHBanner = banner;
                    zhiBoShowVC.roomId = banner.roomId;
                    zhiBoShowVC.playurl = banner.playurl;
                }
                else{
                    ZBHLives *lives = self.firstSectionCellDataSource[indexPath.row];
                    zhiBoShowVC.ZBHLives = lives;
                    zhiBoShowVC.roomId = lives.roomId;
                    zhiBoShowVC.playurl = lives.playurl;
                }
            }
        }
            break;
        default:    //其他各分区
        {
            NRDPartitions *partitions = self.partitionsMArray[indexPath.section-1];
            NSArray *array = partitions.lives;
            NRDLives *lives = array[indexPath.row];
            zhiBoShowVC.NRDLives = lives;
            zhiBoShowVC.roomId = lives.roomId;
            zhiBoShowVC.playurl = lives.playurl;
        }
            break;
    }

    zhiBoShowVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:zhiBoShowVC animated:YES];
    zhiBoShowVC.hidesBottomBarWhenPushed = NO;
}

#pragma mark UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    
    if (section == 0) {
        return CGSizeMake(ScreenWidth, scrollPicHeight + 70 + 40);
    }
    return CGSizeMake(ScreenWidth, 40);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (section == 9) {
        return CGSizeMake(ScreenWidth, 45);
    }
    return CGSizeZero;
}

//设置每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width = (ScreenWidth - 30)/2;
    CGFloat height = scrollPicHeight*3/4 + 40 ;

    if (indexPath.section == 0) {
        ZBHRecommendData *recommendData = self.tuiJianZhuoBoMArray[0];
        NSArray *recommendDataArray = recommendData.bannerData;
        
        if (recommendDataArray.count == 1){
            if (indexPath.row == 6) {
                return CGSizeMake(ScreenWidth-20, height);
            }
        }
        else {
            if (indexPath.row == 0 && indexPath.row == 7) {
                return CGSizeMake(ScreenWidth-20, height);
            }
        }
    }
    return CGSizeMake(width, height);
}

#pragma mark 网络请求
- (void)NetWorkRequest{

    //顶部网络请求
    NSString *urlString = @"http://live.bilibili.com/AppNewIndex/common?scale=2&device=phone&platform=ios";
    [AFNetWorkRequest getRequestWithUrl:urlString result:^(id result) {
        
        //设置顶部滚动轮播图数据源 及 各分区数据网络请求
        NRDZHIBOHOMEMODEL *model = [NRDZHIBOHOMEMODEL modelObjectWithDictionary:result];
        NRDData *data = model.data;
        self.bannerTopImageMArray = [NSMutableArray arrayWithArray:data.banner];
        NSArray *partitionsArray = [NSArray arrayWithArray:data.partitions];
        for (int i = 0; i < partitionsArray.count; i++) {
            
            NRDPartitions *partitions = partitionsArray[i];
            [self.partitionsMArray addObject:partitions];
        }

        //推荐主播数据
        [self FenQuNetWorkRequest];
    }];
}

- (void)FenQuNetWorkRequest{
    //推荐主播数据
    NSString *urlString2 = @"http://live.bilibili.com/AppNewIndex/recommend?access_key=d537dbcb26008395b9f588a98aa66234&actionKey=appkey&appkey=27eb53fc9058f8c3&build=3940&buvid=02914B2D-43B9-4E62-87BA-27D3C8154EEA19998infoc&device=phone&mobi_app=iphone&platform=ios&scale=2&sign=b2df542c0ec6636a789d93098d8837ae&ts=1477841187";
    [AFNetWorkRequest getRequestWithUrl:urlString2 result:^(id result) {
        
        ZBHZBHMODEL *zbhzbModel = [ZBHZBHMODEL modelObjectWithDictionary:result];
        ZBHData *data = zbhzbModel.data;
        ZBHRecommendData *recomendData = data.recommendData;
        [self.tuiJianZhuoBoMArray addObject:recomendData];
        
        NSArray *livesArray = recomendData.lives;
        //推荐直播处理后数据
        if (recomendData.bannerData.count == 1) {
            
            //先添加第一部分数据
            for (int i = 0; i < 6; i++) {
                [self.firstSectionCellDataSource addObject:livesArray[i]];
            }
            //添加中间数据
            [self.firstSectionCellDataSource addObject:[recomendData.bannerData lastObject]];
            //最后添加剩下的部分
            for (int i = 6; i < livesArray.count; i++) {
                [self.firstSectionCellDataSource addObject:livesArray[i]];
            }
        }
        else{
            //先添加banner里面的数据
            [self.firstSectionCellDataSource addObject:[recomendData.bannerData objectAtIndex:0]];
            //再添加第一部分数据
            for (int i = 0; i < 6; i++) {
                [self.firstSectionCellDataSource addObject:livesArray[i]];
            }
            //添加中间数据
            [self.firstSectionCellDataSource addObject:[recomendData.bannerData lastObject]];
            //最后添加剩下的部分
            for (int i = 6; i < livesArray.count; i++) {
                [self.firstSectionCellDataSource addObject:livesArray[i]];
            }
        }
        //刷新数据源
        [self.collectionView reloadData];
    }];
}

@end




































































