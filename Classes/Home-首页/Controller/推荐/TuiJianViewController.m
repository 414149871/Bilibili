//
//  TuiJianViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/10/23.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "TuiJianViewController.h"
#import "AFNetWorkRequest.h"
#import "DataModels.h"
#import "RLScrollPic.h"
#import "TuiJianHeaderButton.h"
#import "TuiJianReMenCollectionReusableView.h"
#import "TuiJianCommentHeaderCollectionReusableView.h"
#import "HomeTuiJianCollectionViewCell.h"
#import "HomeTuiJianZhiBoCollectionViewCell.h"
#import "HomeTuiJianHuoDongZhongXinCollectionViewCell.h"
#import "TuiJianFanJuFooterCollectionReusableView.h"
#import "TuiJianDongHuaFooterCollectionReusableView.h"
#import <UIImageView+WebCache.h>
#import "TuiJianTopScrollViewController.h"
#import "Home_TuiJian_DataBase.h"
#import "Home_TuiJian_FMDBase.h"

#define scrollPicHeight  ScreenWidth / 3.1

#define FirstCellIdentifier        @"FirstCellIdentifier"
#define SecondCellIdentifier       @"SecondCellIdentifier"
#define TuiJianZhiBoCellIdentifier @"TuiJianZhiBoCellIdentifier"
#define TuiJianReMenIdentifier     @"TuiJianReMenIdentifier"
#define TuiJianFanJuIdentifier     @"TuiJianFanJuIdentifier"
#define TuiJianHuoDongZhongXinIdentifier     @"TuiJianHuoDongZhongXinIdentifier"
#define TuiJianFanJuFooterIdenterfier   @"TuiJianFanJuFooterIdenterfier"
#define TuiJianDongHuaFooterIdentifier  @"TuiJianDongHuaFooterIdentifier"
#define CommentHeaderIdentifier    @"CommentHeaderIdentifier"
@interface TuiJianViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong)UICollectionView  *collectionView;
@property (nonatomic,strong)NSMutableArray  *bannerTopImageMArray;  //顶部滚动图片数据源
@property (nonatomic,strong)NSMutableArray  *dataSource;
@end

@implementation TuiJianViewController

- (UICollectionView *)collectionView{
    
    if(!_collectionView){
        //创建layout (流水布局)
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 10;         //行距
        flowLayout.minimumInteritemSpacing = 10;    //列距
        //设置每个item的大小（通过代理设置）  flowLayout.itemSize
        //设置上下左右的边距距离（通过代理设置）  flowLayout.sectionInset
        //滚动的方向
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 64 -49) collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.backgroundColor = RLColor(241, 241, 241);
        _collectionView.showsVerticalScrollIndicator = NO;
        //注册单元格
        [_collectionView registerNib:[UINib nibWithNibName:@"HomeTuiJianCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:FirstCellIdentifier];
        //直播
         [_collectionView registerNib:[UINib nibWithNibName:@"HomeTuiJianZhiBoCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:TuiJianZhiBoCellIdentifier];
        //番剧
        [_collectionView registerNib:[UINib nibWithNibName:@"HomeTuiJianZhiBoCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:TuiJianFanJuIdentifier];
        //活动中心
        [_collectionView registerClass:[HomeTuiJianHuoDongZhongXinCollectionViewCell class] forCellWithReuseIdentifier:TuiJianHuoDongZhongXinIdentifier];
        
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:SecondCellIdentifier];

        //注册头部区域
        [_collectionView registerNib:[UINib nibWithNibName:@"TuiJianReMenCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:TuiJianReMenIdentifier];

        [_collectionView registerNib:[UINib nibWithNibName:@"TuiJianCommentHeaderCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CommentHeaderIdentifier];

        //注册尾部区域
        [_collectionView registerNib:[UINib nibWithNibName:@"TuiJianFanJuFooterCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:TuiJianFanJuFooterIdenterfier];

        [_collectionView registerNib:[UINib nibWithNibName:@"TuiJianDongHuaFooterCollectionReusableView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:TuiJianDongHuaFooterIdentifier];
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

//数据源
- (NSMutableArray *)dataSource{
    if(!_dataSource){
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RLCommonBgColor;
    //网络请求
    [self netWorkRequest];
    [self.view addSubview:self.collectionView];
}

#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    Data *dataModel = self.dataSource[section];
    if (section == 9) {
        return 1;
    }
    return dataModel.body.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    Data *data = self.dataSource[indexPath.section];
    switch (indexPath.section) {
        case 0:case 3:case 4:case 5:case 6:case 7:case 8:case 10:case 11:case 12:case 13:case 14:case 15:
        {
            HomeTuiJianCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:FirstCellIdentifier forIndexPath:indexPath];
            cell.model = data.body[indexPath.row];
            cell.bodyArray = data.body;
            cell.indexPath = indexPath;
            return cell;
        }
        case 1:{
        
            HomeTuiJianZhiBoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TuiJianZhiBoCellIdentifier forIndexPath:indexPath];
            cell.tuiJianZhiBoModel = data.body[indexPath.row];
            cell.bodyArray = data.body;
            cell.indexPath = indexPath;
            return cell;
        }
        case 2:{
            
            HomeTuiJianZhiBoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TuiJianFanJuIdentifier forIndexPath:indexPath];
            cell.tuiJianFanJuModel = data.body[indexPath.row];
            return cell;
        }
        case 9:{
            
            HomeTuiJianHuoDongZhongXinCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:TuiJianHuoDongZhongXinIdentifier forIndexPath:indexPath];
            cell.tuiJianHuoDongZhongXinModel = data;
            return cell;
        }
    }
    return nil;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        if (indexPath.section == 0) {
            TuiJianReMenCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:TuiJianReMenIdentifier forIndexPath:indexPath];
            headerView.bannerTopImageMArray = self.bannerTopImageMArray;
            
            __weak typeof(self) weakSelf = self;
            //点击滚动视图回传的图片第几张数值
            headerView.scrollPic.imageViewTapAtIndex = ^(NSInteger num){
            
                Data *dataModel = self.dataSource[indexPath.section];
                Banner *banner = dataModel.banner;
                NSArray *array = banner.top;
                Top *top = array[num];
                
                TuiJianTopScrollViewController *vc = [[TuiJianTopScrollViewController alloc] initWithNibName:@"TuiJianTopScrollViewController" bundle:[NSBundle mainBundle]];
                vc.urlString = top.uri;
                [weakSelf.navigationController pushViewController:vc animated:YES];
            };
            return headerView;
        }
        else{
            TuiJianCommentHeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CommentHeaderIdentifier forIndexPath:indexPath];
            //设置推荐直播  当前xx个直播
            Data *data1 = self.dataSource[1];
            Ext *ext = data1.ext;
            headerView.ext = ext;
            
            headerView.indexPath = indexPath;
            return headerView;
        }
    }
    else{
        if (indexPath.section == 2) {
            //设置番剧尾部视图
            TuiJianFanJuFooterCollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:TuiJianFanJuFooterIdenterfier forIndexPath:indexPath];
            return footerView;
        }
       
        Data *data = self.dataSource[indexPath.section];
        Banner *banner = data.banner;
        Bottom *bottom = banner.bottom[0];
        if (bottom) {
            
            //设置bottom存在的分区的尾部
            TuiJianDongHuaFooterCollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:TuiJianDongHuaFooterIdentifier forIndexPath:indexPath];
            footer.bottom = bottom;
            return footer;
        }
    }
    return nil;
}

//设置每个分区Header的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        return CGSizeMake(ScreenWidth, scrollPicHeight+40);
    }
    else{
        return CGSizeMake(ScreenWidth, 40);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    if (section == 2) {
        return CGSizeMake(ScreenWidth, 35);
    }
    else{
        Data *data = self.dataSource[section];
        Banner *banner = data.banner;
        if (banner.bottom.count > 0) {
            CGFloat height = scrollPicHeight * 3/4;
            return CGSizeMake(ScreenWidth, height);
        }
        else
            return CGSizeZero;
    }
}

//设置每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat width = (ScreenWidth - 30)/2;
    CGFloat height = scrollPicHeight * 3/4 + 40 ;

    if (indexPath.section == 9) {
        return CGSizeMake(ScreenWidth, height);
    }
    else{
        return CGSizeMake(width, height);
    }
}

//设置上下左右的边距距离
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    if (section == 9) {
        return UIEdgeInsetsZero;
    }
    else{
         return UIEdgeInsetsMake(0, 10, 10, 10);
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

//    NSLog(@"%ld,%ld",indexPath.section,indexPath.row);
    Data *data = self.dataSource[indexPath.section];
    Body *body = data.body[indexPath.row];
    
//    [Home_TuiJian_DataBase insertModel:body];   //插入数据(C语言写)
    
    [Home_TuiJian_FMDBase insertModel:body];
//    RLLog(@"%@",NSHomeDirectory());
}

#pragma mark 网络请求
- (void)netWorkRequest{
    
    NSString *urlString = @"http://app.bilibili.com/x/v2/show?actionKey=appkey&appkey=27eb53fc9058f8c3&build=3940&channel=appstore&device=phone&mobi_app=iphone&plat=1&platform=ios&sign=1&ts=1&warm=1";
    [AFNetWorkRequest getRequestWithUrl:urlString result:^(id result) {
        
        TuiJianModel *model = [TuiJianModel modelObjectWithDictionary:result];
        NSArray *data = [model.data copy];
        Data *dataModel = data[0];
        Banner *banner = [dataModel.banner copy];
        //设置头部滚动数据
        for (int i = 0; i <banner.top.count; i++) {
            Top *top = banner.top[i];
            [self.bannerTopImageMArray addObject: top.image];
        }

        //设置数据源
        for (Data *datamodel in data) {
            [self.dataSource addObject:datamodel];
        }
        [self.collectionView reloadData];
    }];
}


@end
















































































