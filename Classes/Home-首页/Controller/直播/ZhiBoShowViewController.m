//
//  ZhiBoShowViewController.m
//  Bilibili
//
//  Created by 刘嘉豪 on 2016/11/15.
//  Copyright © 2016年 Rick_Liu. All rights reserved.
//

#import "ZhiBoShowViewController.h"
#import "AFNetWorkRequest.h"
#import "ZBXQDataModels.h"
#import <UIImageView+WebCache.h>
#import "NumberDealTool.h"
#import "ZhiBoPlayView.h"
#import "ZhiBoShowView.h"

#define height  (ScreenHeight - 200 - 70 - 44-49)
@interface ZhiBoShowViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIScrollView  *bgScrollView;
@property (nonatomic,strong)UITableView  *huDongTableView;
@property (nonatomic,strong)UITableView  *chongNengBangTaleView;
@property (nonatomic,strong)UITableView  *qiRiBangTableView;
@property (nonatomic,strong)UITableView  *fansTableView;

@property (nonatomic,strong)ZhiBoPlayView  *zhiBoPlayView;
@property (nonatomic,strong)ZhiBoShowView  *zhiBoShowView;
@end

@implementation ZhiBoShowViewController

- (UIScrollView *)bgScrollView{
    
    if(!_bgScrollView){
        
        _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, height)];
        _bgScrollView.delegate = self;
        _bgScrollView.bounces = NO;
        _bgScrollView.showsHorizontalScrollIndicator = NO;
        _bgScrollView.pagingEnabled = YES;
        _bgScrollView.contentSize = CGSizeMake(ScreenWidth * 4, 0);
        _bgScrollView.backgroundColor = RLColor(241, 241, 241);
        [_bgScrollView addSubview:self.huDongTableView];
        [_bgScrollView addSubview:self.chongNengBangTaleView];
        [_bgScrollView addSubview:self.qiRiBangTableView];
        [_bgScrollView addSubview:self.fansTableView];
    }
    return _bgScrollView;
}

//互动
- (UITableView *)huDongTableView{
    
    if(!_huDongTableView){
        _huDongTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, height) style:UITableViewStylePlain];
        _huDongTableView.backgroundColor = RLColor(241, 241, 241);
    }
    return _huDongTableView;
}

//充能榜
- (UITableView *)chongNengBangTaleView{
    
    if(!_chongNengBangTaleView){
        
        _chongNengBangTaleView = [[UITableView alloc] initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, height) style:UITableViewStylePlain];
        _chongNengBangTaleView.backgroundColor = RLColor(241, 241, 241);
    }
    return _chongNengBangTaleView;
}

//七日榜
- (UITableView *)qiRiBangTableView{
    
    if(!_qiRiBangTableView){
        
        _qiRiBangTableView = [[UITableView alloc] initWithFrame:CGRectMake(ScreenWidth *2, 0, ScreenWidth, height) style:UITableViewStylePlain];
        _qiRiBangTableView.backgroundColor = RLColor(241, 241, 241);
    }
    return _qiRiBangTableView;
}

//粉丝榜
- (UITableView *)fansTableView{
    
    if(!_fansTableView){
        
        _fansTableView = [[UITableView alloc] initWithFrame:CGRectMake(ScreenWidth *3, 0, ScreenWidth, height) style:UITableViewStylePlain];
        _fansTableView.backgroundColor = RLColor(241, 241, 241);
    }
    return _fansTableView;
}

//直播playView
- (ZhiBoPlayView *)zhiBoPlayView{
    
    if(!_zhiBoPlayView){
        _zhiBoPlayView = [[ZhiBoPlayView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
        _zhiBoPlayView.zhiBoShowView = self.zhiBoShowView;
    }
    return _zhiBoPlayView;
}

//直播showView
- (ZhiBoShowView *)zhiBoShowView{
    
    if(!_zhiBoShowView){
        _zhiBoShowView = [[[NSBundle mainBundle] loadNibNamed:@"ZhiBoShowView" owner:nil options:nil] objectAtIndex:0];
        _zhiBoShowView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
        _zhiBoShowView.urlString = _playurl;
        [_zhiBoShowView.player play];
    }
    return _zhiBoShowView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //导航栏设置
    [self navigationBar];
    //样式设置
    [self layoutSettiong];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.xiangQingView addSubview:self.bgScrollView];
    //网络请求
    [self netWorkRequest];
    //设置直播
    [self.playView addSubview:self.zhiBoShowView];
    //添加按钮View(zhiBoPlayView)
    [self.playView addSubview:self.zhiBoPlayView];
    NSLog(@"%@",_playurl);
}

#pragma mark 导航栏设置
- (void)navigationBar{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"live_back_ico"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
}

#pragma mark 样式设置
- (void)layoutSettiong{

    _attentionBtn.layer.borderColor = RLCommonBgColor.CGColor;
    _attentionBtn.layer.borderWidth = 1.0;

    _danmakuTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _danmakuTextField.layer.borderWidth = 1.0;

    _huDongBtn.selected = YES;
    //互动
    [_huDongBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_huDongBtn setTitleColor:RLCommonBgColor forState:UIControlStateSelected];
    //冲能榜
    [_chongNengBangBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_chongNengBangBtn setTitleColor:RLCommonBgColor forState:UIControlStateSelected];
    //七日榜
    [_qiRiBangBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_qiRiBangBtn setTitleColor:RLCommonBgColor forState:UIControlStateSelected];
    //粉丝榜
    [_fansBang setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_fansBang setTitleColor:RLCommonBgColor forState:UIControlStateSelected];

}

#pragma mark 响应事件
- (void)backAction:(UIBarButtonItem *)sender{

    [self.zhiBoShowView.player shutdown];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)selectedAction:(UIButton *)sender {
    
    //调整字体颜色
    for (int i = 100; i < 104; i++) {
        UIButton *btn = [self.view viewWithTag:i];
        btn.selected = NO;
    }
    sender.selected = YES;
    //改变底部滚动view的位置
    [UIView animateWithDuration:0.25 animations:^{
        _selectedBottomView.RL_centerX = sender.RL_centerX;
    }];
    //点击按钮，偏移bgScrollView
    NSInteger page = sender.tag - 100;
    [_bgScrollView setContentOffset:CGPointMake(ScreenWidth * page, 0) animated:NO];
}

#pragma mark  UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

   NSInteger page = scrollView.contentOffset.x / ScreenWidth;

    //调整字体颜色
    for (int i = 100; i < 104; i++) {
        UIButton *btn = [self.view viewWithTag:i];
        btn.selected = NO;
    }
    
    UIButton *btn = [self.view viewWithTag:page +100];
    btn.selected = YES;
    //改变底部滚动view的位置
    [UIView animateWithDuration:0.25 animations:^{
        _selectedBottomView.RL_centerX = btn.RL_centerX;
    }];
}

#pragma mark 网络请求
- (void)netWorkRequest{
    NSString *urlString = [NSString stringWithFormat:@"http://live.bilibili.com/AppRoom/index?actionKey=appkey&appkey=27eb53fc9058f8c3&build=3940&buvid=02914B2D-43B9-4E62-87BA-27D3C8154EEA19998infoc&device=phone&jumpFrom=24000&mobi_app=iphone&platform=ios&room_id=%f&scale=2&sign=fd18d84107ddaf3fc84137d3f2efb8fa&ts=1478776793",_roomId];
    [AFNetWorkRequest getRequestWithUrl:urlString result:^(id result) {
        
        ZBXQZBXQ *zbxqModel = [ZBXQZBXQ modelObjectWithDictionary:result];
        ZBXQData *data = zbxqModel.data;
        
        //控件赋值
        [_face sd_setImageWithURL:[NSURL URLWithString:data.face]];
        _titleLabel.text = data.title;
        _master_level.text = [NSString stringWithFormat:@"UP%.0f",data.masterLevel];
        [_uname setTitle:data.uname forState:UIControlStateNormal];
        _online.text = [NumberDealTool dealwithPlayNum:@(data.online)];
        _attention.text = [NumberDealTool dealwithPlayNum:@(data.attention)];
    }];
}

#pragma mark 设置直播
- (void)viewWillAppear:(BOOL)animated{

    if (![self.zhiBoShowView.player isPlaying]) {
        [self.zhiBoShowView.player prepareToPlay];
    }
}

@end











































































