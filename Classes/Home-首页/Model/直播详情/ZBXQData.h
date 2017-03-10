//
//  ZBXQData.h
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZBXQMeta, ZBXQSchedule, ZBXQGuardInfo;

@interface ZBXQData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *cmt;
@property (nonatomic, strong) NSArray *toplist;
@property (nonatomic, assign) double cmtPort;
@property (nonatomic, assign) double isadmin;
@property (nonatomic, assign) double roomId;
@property (nonatomic, strong) NSString *uname;
@property (nonatomic, assign) double activityId;
@property (nonatomic, assign) double cmtPortGoim;
@property (nonatomic, assign) double opentime;
@property (nonatomic, assign) double schId;
@property (nonatomic, assign) double checkVersion;
@property (nonatomic, assign) double isvip;
@property (nonatomic, strong) ZBXQMeta *meta;
@property (nonatomic, assign) double create;
@property (nonatomic, strong) NSString *createAt;
@property (nonatomic, strong) ZBXQSchedule *schedule;
@property (nonatomic, strong) NSString *cover;
@property (nonatomic, strong) NSString *area;
@property (nonatomic, strong) NSString *mFace;
@property (nonatomic, assign) double broadcastType;
@property (nonatomic, strong) NSArray *roomgifts;
@property (nonatomic, strong) NSArray *ignoreGift;
@property (nonatomic, assign) double guardLevel;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) double online;
@property (nonatomic, strong) ZBXQGuardInfo *guardInfo;
@property (nonatomic, assign) double msgMode;
@property (nonatomic, strong) NSArray *recommend;
@property (nonatomic, strong) NSArray *eventCorner;
@property (nonatomic, assign) double mid;
@property (nonatomic, assign) double areaId;
@property (nonatomic, assign) double backgroundId;
@property (nonatomic, strong) NSArray *hotWord;
@property (nonatomic, assign) double msgLength;
@property (nonatomic, strong) NSString *face;
@property (nonatomic, assign) double attention;
@property (nonatomic, assign) double masterLevel;
@property (nonatomic, assign) double guardNotice;
@property (nonatomic, assign) double isAttention;
@property (nonatomic, strong) NSArray *activityGift;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) double msgColor;
@property (nonatomic, strong) NSString *prepare;
@property (nonatomic, assign) double masterLevelColor;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
