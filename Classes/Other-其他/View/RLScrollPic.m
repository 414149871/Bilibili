//
//  RLScrollPic.m
//  PICScroll
//
//  Created by 刘嘉豪 on 2016/10/24.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "RLScrollPic.h"

#define RLRelativeW(w) [UIScreen mainScreen].bounds.size.width * w/320
#define RLRelativeH(h) [UIScreen mainScreen].bounds.size.height * h/568
#define pageSize RLRelativeH(15)
#define myWidth self.frame.size.width
#define myHeight self.frame.size.height

#pragma mark --自定义轮播图--
@interface RLScrollPic ()<UIScrollViewDelegate>

@property (nonatomic,strong)NSMutableDictionary  *webImageCache;

@property (nonatomic,copy)NSArray  *imageData;

@property (nonatomic,copy)NSString  *cachePath;
@end

@implementation RLScrollPic
{
    //使用三张图片来实现轮播图,声明__weak 弱引用防止内存泄漏
    __weak UIImageView *_leftImageView,*_centerImageView, *_rightImageView;
    __weak UILabel *_leftLabel, *_centerLabel, *_rightLabel;
    __weak UIScrollView *_scrollView;
    __weak UIPageControl *_pageControl;
    
    NSTimer *_timer;
    NSInteger _currentIndex;
    NSInteger _MaxImageCount;
    
    BOOL _isNetWork;
    BOOL _hasTitle;
}

//lazy
- (NSMutableDictionary *)webImageCache{
    
    if (!_webImageCache) {
        _webImageCache = [[NSMutableDictionary alloc] init];
    }
    return _webImageCache;
}

- (NSString *)cachePath{
    
    if(!_cachePath){
        
        _cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    }
    return _cachePath;
}


- (instancetype)initWithFrame:(CGRect)frame WithImageName:(NSArray <NSString *> *)ImageName{

    if (ImageName.count < 2) {
        return nil;
    }
    if (self = [super initWithFrame:frame]) {
        
        [self prepareScrollView];
        [self setImageData:ImageName];
        [self setMaxImageCount:_imageData.count];
    }
    return self;
}

- (void)prepareScrollView{

    UIScrollView *sc = [[UIScrollView alloc] initWithFrame:self.bounds];
    [self addSubview:sc];
    
    _scrollView = sc;
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    
    _scrollView.contentSize = CGSizeMake(myWidth * 3, 0);
    _AutoScrollDelay = 2.0f;
    _currentIndex = 0;
}

- (void)setImageData:(NSArray *)ImageNames{

    _isNetWork = [ImageNames.firstObject hasPrefix:@"http://"] || [ImageNames.firstObject hasPrefix:@"https://"];
    if (_isNetWork) {
        
        _imageData = [ImageNames copy];
        //网络请求图片
        [self getImage];
    }
    else{
    
        NSMutableArray *temp = [NSMutableArray arrayWithCapacity:ImageNames.count];
        
        for (NSString *name in ImageNames) {
            
            [temp addObject:[UIImage imageNamed:name]];
        }
        _imageData = [temp copy];
    }
}

//网络请求图片
- (void)getImage{
    
    for (NSString *urlString in _imageData) {
        
        if ([self LoadDiskCacheWithUrlString:urlString]) {
            continue;
        }
        
        [[[NSURLSession sharedSession] dataTaskWithURL:[NSURL URLWithString:urlString] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            //分离出网络缓存部分   //路径？  应该是self.cachePath
            [self downLoadImagefinish:data url:urlString savePath:[self.cachePath stringByAppendingPathComponent:urlString.lastPathComponent] error:error];
            
        }] resume];
    }
}

- (BOOL)LoadDiskCacheWithUrlString:(NSString *)urlString{

    //取沙盒缓存
    NSData *data = [NSData dataWithContentsOfFile:[self.cachePath stringByAppendingPathComponent:urlString.lastPathComponent]];
    
    if (data.length > 0) {
        
        UIImage *image = [UIImage imageWithData:data];
        //如果图片有效
        if (image) {
            [self.webImageCache setObject:image forKey:urlString];
        }
        else{
            [[NSFileManager defaultManager] removeItemAtPath:[self.cachePath stringByAppendingPathComponent:urlString.lastPathComponent] error:NULL];
        }
    }
    return NO;
}

- (void)downLoadImagefinish:(NSData *)data url:(NSString *)urlString savePath:(NSString *)path error:(NSError *)error{

    UIImage *image = [UIImage imageWithData:data];
    if (error) {
        if (self.downLoadImageError) {
            self.downLoadImageError(error,urlString);
        }
        return;
    }
    
    if (!image) {
        NSString *errorData = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSError *error = [NSError errorWithDomain:errorData code:381 userInfo:nil];
        if (self.downLoadImageError) {
            self.downLoadImageError(error,urlString);
        }
        return ;
    }
    
    //沙盒缓存
    [data writeToFile:[path stringByAppendingPathComponent:urlString.lastPathComponent] atomically:YES];
    //内存缓存
    [self.webImageCache setObject:image forKey:urlString];
}

- (void)setMaxImageCount:(NSInteger)MaxImageCount{

    _MaxImageCount = MaxImageCount;
    [self prepareImageView];
    [self preparePageControl];
    
    [self setUpTimer];
    
    [self changeImageLeft:_MaxImageCount-1 center:0 right:1];
}

- (void)prepareImageView{

    UIImageView *left = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, myWidth, myHeight)];
    left.contentMode = UIViewContentModeScaleToFill;
    UIImageView *center = [[UIImageView alloc] initWithFrame:CGRectMake(myWidth, 0, myWidth, myHeight)];
    center.contentMode = UIViewContentModeScaleToFill;
    UIImageView *right = [[UIImageView alloc] initWithFrame:CGRectMake(myWidth *2, 0, myWidth, myHeight)];
    right.contentMode = UIViewContentModeScaleToFill;
    
    center.userInteractionEnabled = YES;
    [center addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewDidTap)]];
    
    [_scrollView addSubview:left];
    [_scrollView addSubview:center];
    [_scrollView addSubview:right];
    
    _leftImageView = left;
    _centerImageView = center;
    _rightImageView = right;
}

- (void)imageViewDidTap{

    if (self.imageViewTapAtIndex != nil) {
        self.imageViewTapAtIndex(_currentIndex);
    }
}

- (void)preparePageControl{

//    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(0, myHeight - pageSize, myWidth, RLRelativeH(30))];
    UIPageControl *page = [[UIPageControl alloc] initWithFrame:CGRectMake(myWidth-100, myHeight - pageSize, 100, RLRelativeH(15))];
    page.pageIndicatorTintColor = [UIColor whiteColor];
    page.currentPageIndicatorTintColor = [UIColor colorWithRed:247/255.0 green:88/255.0 blue:135/255.0 alpha:1.0];
    page.numberOfPages = _MaxImageCount;
    page.currentPage = 0;
    [self addSubview:page];
    
    _pageControl = page;
}

- (void)setUpTimer{

    if (_AutoScrollDelay < 0.5)  return;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:_AutoScrollDelay target:self selector:@selector(scroll) userInfo:nil repeats:YES];
}

- (void)removeTimer{

    if (_timer == nil) return;
    [_timer invalidate];
    _timer = nil;
}

- (void)scroll{

    [_scrollView setContentOffset:CGPointMake(_scrollView.contentOffset.x + myWidth, 0) animated:YES];
}

- (void)changeImageLeft:(NSInteger)LeftIndex center:(NSInteger)centerIndex right:(NSInteger)rightIndex{

    if (_isNetWork) {
        
        _leftImageView.image = [self setImageWithIndex:LeftIndex];
        _centerImageView.image  = [self setImageWithIndex:centerIndex];
        _rightImageView.image = [self setImageWithIndex:rightIndex];
    }
    else{
    
        _leftImageView.image = _imageData[LeftIndex];
        _centerImageView.image  = _imageData[centerIndex];
        _rightImageView.image = _imageData[rightIndex];
    }
    
    if (_hasTitle) {
        _leftLabel.text = _titleData[LeftIndex];
        _centerLabel.text = _titleData[centerIndex];
        _rightLabel.text = _titleData[rightIndex];
    }
    
    [_scrollView setContentOffset:CGPointMake(myWidth, 0)];
}

- (UIImage *)setImageWithIndex:(NSInteger)index{

    //从内存缓存中取,如果没有使用占位图片
    UIImage *image = [self.webImageCache valueForKey:_imageData[index]];
    if (image) {
        return image;
    }
    else{
        return _placeImage;
    }
}

- (void)setTitleData:(NSArray<NSString *> *)titleData{

    if (titleData.count < 2) return;
    
    if (titleData.count < _imageData.count) {
        
        NSMutableArray *temp = [NSMutableArray arrayWithArray:titleData];
        for (int i = 0; i < _imageData.count - titleData.count; i++) {
            [temp addObject:@""];
        }
        _titleData = [temp copy];
    }
    else{
        _titleData = [titleData copy];
    }
    
    [self prepareTitleLabel];
    _hasTitle = YES;
    [self changeImageLeft:_MaxImageCount-1 center:0 right:1];
}

- (void)prepareTitleLabel{

    [self setStyle:PageControllAtRight];
    
    UIView *left = [self createLabelBgView];
    UIView *center = [self createLabelBgView];
    UIView *right = [self createLabelBgView];
    
    _leftLabel = (UILabel *)left.subviews.firstObject;
    _centerLabel = (UILabel *)center.subviews.firstObject;
    _rightLabel = (UILabel *)right.subviews.firstObject;
    
    [_leftImageView addSubview:left];
    [_centerImageView addSubview:center];
    [_rightImageView addSubview:right];
}

- (void)setStyle:(PageControlStyle)style{

    if (style == PageControllAtRight) {
        CGFloat w = _MaxImageCount * pageSize;
        // 7 ?
        _pageControl.frame = CGRectMake(myWidth - w, myHeight - pageSize, w, 7);
    }
}

- (UIView *)createLabelBgView{

    CGFloat h = RLRelativeH(30);
    if (myHeight * 0.1 > 25) {
        h = myHeight * 0.1;
    }
    
    UIImageView *v = [[UIImageView alloc] initWithFrame:CGRectMake(0, myHeight - h, myWidth, h)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(RLRelativeW(16), 0, myWidth - _pageControl.frame.size.width, h)];
    label.textAlignment = NSTextAlignmentLeft;
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:11.0f];
    [v addSubview:label];
    return v;
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    [self setUpTimer];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{

    [self removeTimer];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    [self changeImageWithOffset:scrollView.contentOffset.x];
}

- (void)changeImageWithOffset:(CGFloat)offsetX{

    if (offsetX >= myWidth * 2) {
        
        _currentIndex++;
        if (_currentIndex == _MaxImageCount - 1) {
            [self changeImageLeft:_currentIndex-1 center:_currentIndex right:0];
        }
        else if (_currentIndex == _MaxImageCount){
        
            _currentIndex = 0;
            [self changeImageLeft:_MaxImageCount-1 center:0 right:1];
        }
        else{
        
            [self changeImageLeft:_currentIndex-1 center:_currentIndex right:_currentIndex+1];
        }
        _pageControl.currentPage = _currentIndex;
    }
    
    if (offsetX <= 0) {
        
        _currentIndex--;
        if (_currentIndex == 0) {
            [self changeImageLeft:_MaxImageCount-1 center:0 right:1];
        }
        else if (_currentIndex == -1){
        
            _currentIndex = _MaxImageCount - 1;
            [self changeImageLeft:_currentIndex-1 center:_currentIndex right:0];
        }
        else{
            [self changeImageLeft:_currentIndex-1 center:_currentIndex right:_currentIndex+1];
        }
        
        _pageControl.currentPage = _currentIndex;
    }
}

- (void)setAutoScrollDelay:(NSTimeInterval)AutoScrollDelay{

    _AutoScrollDelay = AutoScrollDelay;
    [self removeTimer];
    [self setUpTimer];
}

- (void)dealloc{
    [self removeTimer];
}

@end

































































































