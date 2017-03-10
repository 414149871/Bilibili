//
//  RLScrollPic.h
//  PICScroll
//
//  Created by 刘嘉豪 on 2016/10/24.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger,PageControlStyle) {

    PageControllAtCenter,
    PageControllAtRight,
};

@interface RLScrollPic : UIView

/*占位图*/
@property (nonatomic,strong)UIImage  *placeImage;
/*自动播放延迟的时间*/
@property (nonatomic,assign)NSTimeInterval  AutoScrollDelay;
/*设置 PageControl 的位置*/
@property (nonatomic,assign)PageControlStyle  style;    //有无 title 的时候可以调整 pageControl 的位置
/*设置轮播图上面的 title, 如果 title 是有数据的话 pageController在右边*/
@property (nonatomic,strong)NSArray<NSString *>  *titleData;

/* 当图片点击时会调用该block */
@property (nonatomic,copy) void(^ imageViewTapAtIndex)(NSInteger index);  //index从0开始
/* 下载网络图片错误时回调错误的信息*/
@property (nonatomic,copy)void(^ downLoadImageError)(NSError *error,NSString *imageUrl);

- (instancetype)initWithFrame:(CGRect)frame WithImageName:(NSArray <NSString *> *)ImageName;


@end





































































































