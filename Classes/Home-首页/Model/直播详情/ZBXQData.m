//
//  ZBXQData.m
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBXQData.h"
#import "ZBXQToplist.h"
#import "ZBXQMeta.h"
#import "ZBXQSchedule.h"
#import "ZBXQRoomgifts.h"
#import "ZBXQIgnoreGift.h"
#import "ZBXQGuardInfo.h"
#import "ZBXQRecommend.h"
#import "ZBXQHotWord.h"
#import "ZBXQActivityGift.h"


NSString *const kZBXQDataCmt = @"cmt";
NSString *const kZBXQDataToplist = @"toplist";
NSString *const kZBXQDataCmtPort = @"cmt_port";
NSString *const kZBXQDataIsadmin = @"isadmin";
NSString *const kZBXQDataRoomId = @"room_id";
NSString *const kZBXQDataUname = @"uname";
NSString *const kZBXQDataActivityId = @"activity_id";
NSString *const kZBXQDataCmtPortGoim = @"cmt_port_goim";
NSString *const kZBXQDataOpentime = @"opentime";
NSString *const kZBXQDataSchId = @"sch_id";
NSString *const kZBXQDataCheckVersion = @"check_version";
NSString *const kZBXQDataIsvip = @"isvip";
NSString *const kZBXQDataMeta = @"meta";
NSString *const kZBXQDataCreate = @"create";
NSString *const kZBXQDataCreateAt = @"create_at";
NSString *const kZBXQDataSchedule = @"schedule";
NSString *const kZBXQDataCover = @"cover";
NSString *const kZBXQDataArea = @"area";
NSString *const kZBXQDataMFace = @"m_face";
NSString *const kZBXQDataBroadcastType = @"broadcast_type";
NSString *const kZBXQDataRoomgifts = @"roomgifts";
NSString *const kZBXQDataIgnoreGift = @"ignore_gift";
NSString *const kZBXQDataGuardLevel = @"guard_level";
NSString *const kZBXQDataStatus = @"status";
NSString *const kZBXQDataOnline = @"online";
NSString *const kZBXQDataGuardInfo = @"guard_info";
NSString *const kZBXQDataMsgMode = @"msg_mode";
NSString *const kZBXQDataRecommend = @"recommend";
NSString *const kZBXQDataEventCorner = @"event_corner";
NSString *const kZBXQDataMid = @"mid";
NSString *const kZBXQDataAreaId = @"area_id";
NSString *const kZBXQDataBackgroundId = @"background_id";
NSString *const kZBXQDataHotWord = @"hot_word";
NSString *const kZBXQDataMsgLength = @"msg_length";
NSString *const kZBXQDataFace = @"face";
NSString *const kZBXQDataAttention = @"attention";
NSString *const kZBXQDataMasterLevel = @"master_level";
NSString *const kZBXQDataGuardNotice = @"guard_notice";
NSString *const kZBXQDataIsAttention = @"is_attention";
NSString *const kZBXQDataActivityGift = @"activity_gift";
NSString *const kZBXQDataTitle = @"title";
NSString *const kZBXQDataMsgColor = @"msg_color";
NSString *const kZBXQDataPrepare = @"prepare";
NSString *const kZBXQDataMasterLevelColor = @"master_level_color";


@interface ZBXQData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBXQData

@synthesize cmt = _cmt;
@synthesize toplist = _toplist;
@synthesize cmtPort = _cmtPort;
@synthesize isadmin = _isadmin;
@synthesize roomId = _roomId;
@synthesize uname = _uname;
@synthesize activityId = _activityId;
@synthesize cmtPortGoim = _cmtPortGoim;
@synthesize opentime = _opentime;
@synthesize schId = _schId;
@synthesize checkVersion = _checkVersion;
@synthesize isvip = _isvip;
@synthesize meta = _meta;
@synthesize create = _create;
@synthesize createAt = _createAt;
@synthesize schedule = _schedule;
@synthesize cover = _cover;
@synthesize area = _area;
@synthesize mFace = _mFace;
@synthesize broadcastType = _broadcastType;
@synthesize roomgifts = _roomgifts;
@synthesize ignoreGift = _ignoreGift;
@synthesize guardLevel = _guardLevel;
@synthesize status = _status;
@synthesize online = _online;
@synthesize guardInfo = _guardInfo;
@synthesize msgMode = _msgMode;
@synthesize recommend = _recommend;
@synthesize eventCorner = _eventCorner;
@synthesize mid = _mid;
@synthesize areaId = _areaId;
@synthesize backgroundId = _backgroundId;
@synthesize hotWord = _hotWord;
@synthesize msgLength = _msgLength;
@synthesize face = _face;
@synthesize attention = _attention;
@synthesize masterLevel = _masterLevel;
@synthesize guardNotice = _guardNotice;
@synthesize isAttention = _isAttention;
@synthesize activityGift = _activityGift;
@synthesize title = _title;
@synthesize msgColor = _msgColor;
@synthesize prepare = _prepare;
@synthesize masterLevelColor = _masterLevelColor;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.cmt = [self objectOrNilForKey:kZBXQDataCmt fromDictionary:dict];
    NSObject *receivedZBXQToplist = [dict objectForKey:kZBXQDataToplist];
    NSMutableArray *parsedZBXQToplist = [NSMutableArray array];
    if ([receivedZBXQToplist isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZBXQToplist) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZBXQToplist addObject:[ZBXQToplist modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZBXQToplist isKindOfClass:[NSDictionary class]]) {
       [parsedZBXQToplist addObject:[ZBXQToplist modelObjectWithDictionary:(NSDictionary *)receivedZBXQToplist]];
    }

    self.toplist = [NSArray arrayWithArray:parsedZBXQToplist];
            self.cmtPort = [[self objectOrNilForKey:kZBXQDataCmtPort fromDictionary:dict] doubleValue];
            self.isadmin = [[self objectOrNilForKey:kZBXQDataIsadmin fromDictionary:dict] doubleValue];
            self.roomId = [[self objectOrNilForKey:kZBXQDataRoomId fromDictionary:dict] doubleValue];
            self.uname = [self objectOrNilForKey:kZBXQDataUname fromDictionary:dict];
            self.activityId = [[self objectOrNilForKey:kZBXQDataActivityId fromDictionary:dict] doubleValue];
            self.cmtPortGoim = [[self objectOrNilForKey:kZBXQDataCmtPortGoim fromDictionary:dict] doubleValue];
            self.opentime = [[self objectOrNilForKey:kZBXQDataOpentime fromDictionary:dict] doubleValue];
            self.schId = [[self objectOrNilForKey:kZBXQDataSchId fromDictionary:dict] doubleValue];
            self.checkVersion = [[self objectOrNilForKey:kZBXQDataCheckVersion fromDictionary:dict] doubleValue];
            self.isvip = [[self objectOrNilForKey:kZBXQDataIsvip fromDictionary:dict] doubleValue];
            self.meta = [ZBXQMeta modelObjectWithDictionary:[dict objectForKey:kZBXQDataMeta]];
            self.create = [[self objectOrNilForKey:kZBXQDataCreate fromDictionary:dict] doubleValue];
            self.createAt = [self objectOrNilForKey:kZBXQDataCreateAt fromDictionary:dict];
            self.schedule = [ZBXQSchedule modelObjectWithDictionary:[dict objectForKey:kZBXQDataSchedule]];
            self.cover = [self objectOrNilForKey:kZBXQDataCover fromDictionary:dict];
            self.area = [self objectOrNilForKey:kZBXQDataArea fromDictionary:dict];
            self.mFace = [self objectOrNilForKey:kZBXQDataMFace fromDictionary:dict];
            self.broadcastType = [[self objectOrNilForKey:kZBXQDataBroadcastType fromDictionary:dict] doubleValue];
    NSObject *receivedZBXQRoomgifts = [dict objectForKey:kZBXQDataRoomgifts];
    NSMutableArray *parsedZBXQRoomgifts = [NSMutableArray array];
    if ([receivedZBXQRoomgifts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZBXQRoomgifts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZBXQRoomgifts addObject:[ZBXQRoomgifts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZBXQRoomgifts isKindOfClass:[NSDictionary class]]) {
       [parsedZBXQRoomgifts addObject:[ZBXQRoomgifts modelObjectWithDictionary:(NSDictionary *)receivedZBXQRoomgifts]];
    }

    self.roomgifts = [NSArray arrayWithArray:parsedZBXQRoomgifts];
    NSObject *receivedZBXQIgnoreGift = [dict objectForKey:kZBXQDataIgnoreGift];
    NSMutableArray *parsedZBXQIgnoreGift = [NSMutableArray array];
    if ([receivedZBXQIgnoreGift isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZBXQIgnoreGift) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZBXQIgnoreGift addObject:[ZBXQIgnoreGift modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZBXQIgnoreGift isKindOfClass:[NSDictionary class]]) {
       [parsedZBXQIgnoreGift addObject:[ZBXQIgnoreGift modelObjectWithDictionary:(NSDictionary *)receivedZBXQIgnoreGift]];
    }

    self.ignoreGift = [NSArray arrayWithArray:parsedZBXQIgnoreGift];
            self.guardLevel = [[self objectOrNilForKey:kZBXQDataGuardLevel fromDictionary:dict] doubleValue];
            self.status = [self objectOrNilForKey:kZBXQDataStatus fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kZBXQDataOnline fromDictionary:dict] doubleValue];
            self.guardInfo = [ZBXQGuardInfo modelObjectWithDictionary:[dict objectForKey:kZBXQDataGuardInfo]];
            self.msgMode = [[self objectOrNilForKey:kZBXQDataMsgMode fromDictionary:dict] doubleValue];
    NSObject *receivedZBXQRecommend = [dict objectForKey:kZBXQDataRecommend];
    NSMutableArray *parsedZBXQRecommend = [NSMutableArray array];
    if ([receivedZBXQRecommend isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZBXQRecommend) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZBXQRecommend addObject:[ZBXQRecommend modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZBXQRecommend isKindOfClass:[NSDictionary class]]) {
       [parsedZBXQRecommend addObject:[ZBXQRecommend modelObjectWithDictionary:(NSDictionary *)receivedZBXQRecommend]];
    }

    self.recommend = [NSArray arrayWithArray:parsedZBXQRecommend];
            self.eventCorner = [self objectOrNilForKey:kZBXQDataEventCorner fromDictionary:dict];
            self.mid = [[self objectOrNilForKey:kZBXQDataMid fromDictionary:dict] doubleValue];
            self.areaId = [[self objectOrNilForKey:kZBXQDataAreaId fromDictionary:dict] doubleValue];
            self.backgroundId = [[self objectOrNilForKey:kZBXQDataBackgroundId fromDictionary:dict] doubleValue];
    NSObject *receivedZBXQHotWord = [dict objectForKey:kZBXQDataHotWord];
    NSMutableArray *parsedZBXQHotWord = [NSMutableArray array];
    if ([receivedZBXQHotWord isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZBXQHotWord) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZBXQHotWord addObject:[ZBXQHotWord modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZBXQHotWord isKindOfClass:[NSDictionary class]]) {
       [parsedZBXQHotWord addObject:[ZBXQHotWord modelObjectWithDictionary:(NSDictionary *)receivedZBXQHotWord]];
    }

    self.hotWord = [NSArray arrayWithArray:parsedZBXQHotWord];
            self.msgLength = [[self objectOrNilForKey:kZBXQDataMsgLength fromDictionary:dict] doubleValue];
            self.face = [self objectOrNilForKey:kZBXQDataFace fromDictionary:dict];
            self.attention = [[self objectOrNilForKey:kZBXQDataAttention fromDictionary:dict] doubleValue];
            self.masterLevel = [[self objectOrNilForKey:kZBXQDataMasterLevel fromDictionary:dict] doubleValue];
            self.guardNotice = [[self objectOrNilForKey:kZBXQDataGuardNotice fromDictionary:dict] doubleValue];
            self.isAttention = [[self objectOrNilForKey:kZBXQDataIsAttention fromDictionary:dict] doubleValue];
    NSObject *receivedZBXQActivityGift = [dict objectForKey:kZBXQDataActivityGift];
    NSMutableArray *parsedZBXQActivityGift = [NSMutableArray array];
    if ([receivedZBXQActivityGift isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZBXQActivityGift) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZBXQActivityGift addObject:[ZBXQActivityGift modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZBXQActivityGift isKindOfClass:[NSDictionary class]]) {
       [parsedZBXQActivityGift addObject:[ZBXQActivityGift modelObjectWithDictionary:(NSDictionary *)receivedZBXQActivityGift]];
    }

    self.activityGift = [NSArray arrayWithArray:parsedZBXQActivityGift];
            self.title = [self objectOrNilForKey:kZBXQDataTitle fromDictionary:dict];
            self.msgColor = [[self objectOrNilForKey:kZBXQDataMsgColor fromDictionary:dict] doubleValue];
            self.prepare = [self objectOrNilForKey:kZBXQDataPrepare fromDictionary:dict];
            self.masterLevelColor = [[self objectOrNilForKey:kZBXQDataMasterLevelColor fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cmt forKey:kZBXQDataCmt];
    NSMutableArray *tempArrayForToplist = [NSMutableArray array];
    for (NSObject *subArrayObject in self.toplist) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForToplist addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForToplist addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForToplist] forKey:kZBXQDataToplist];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cmtPort] forKey:kZBXQDataCmtPort];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isadmin] forKey:kZBXQDataIsadmin];
    [mutableDict setValue:[NSNumber numberWithDouble:self.roomId] forKey:kZBXQDataRoomId];
    [mutableDict setValue:self.uname forKey:kZBXQDataUname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.activityId] forKey:kZBXQDataActivityId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cmtPortGoim] forKey:kZBXQDataCmtPortGoim];
    [mutableDict setValue:[NSNumber numberWithDouble:self.opentime] forKey:kZBXQDataOpentime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.schId] forKey:kZBXQDataSchId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.checkVersion] forKey:kZBXQDataCheckVersion];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isvip] forKey:kZBXQDataIsvip];
    [mutableDict setValue:[self.meta dictionaryRepresentation] forKey:kZBXQDataMeta];
    [mutableDict setValue:[NSNumber numberWithDouble:self.create] forKey:kZBXQDataCreate];
    [mutableDict setValue:self.createAt forKey:kZBXQDataCreateAt];
    [mutableDict setValue:[self.schedule dictionaryRepresentation] forKey:kZBXQDataSchedule];
    [mutableDict setValue:self.cover forKey:kZBXQDataCover];
    [mutableDict setValue:self.area forKey:kZBXQDataArea];
    [mutableDict setValue:self.mFace forKey:kZBXQDataMFace];
    [mutableDict setValue:[NSNumber numberWithDouble:self.broadcastType] forKey:kZBXQDataBroadcastType];
    NSMutableArray *tempArrayForRoomgifts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.roomgifts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRoomgifts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRoomgifts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRoomgifts] forKey:kZBXQDataRoomgifts];
    NSMutableArray *tempArrayForIgnoreGift = [NSMutableArray array];
    for (NSObject *subArrayObject in self.ignoreGift) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForIgnoreGift addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForIgnoreGift addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForIgnoreGift] forKey:kZBXQDataIgnoreGift];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guardLevel] forKey:kZBXQDataGuardLevel];
    [mutableDict setValue:self.status forKey:kZBXQDataStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kZBXQDataOnline];
    [mutableDict setValue:[self.guardInfo dictionaryRepresentation] forKey:kZBXQDataGuardInfo];
    [mutableDict setValue:[NSNumber numberWithDouble:self.msgMode] forKey:kZBXQDataMsgMode];
    NSMutableArray *tempArrayForRecommend = [NSMutableArray array];
    for (NSObject *subArrayObject in self.recommend) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRecommend addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRecommend addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRecommend] forKey:kZBXQDataRecommend];
    NSMutableArray *tempArrayForEventCorner = [NSMutableArray array];
    for (NSObject *subArrayObject in self.eventCorner) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForEventCorner addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForEventCorner addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForEventCorner] forKey:kZBXQDataEventCorner];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mid] forKey:kZBXQDataMid];
    [mutableDict setValue:[NSNumber numberWithDouble:self.areaId] forKey:kZBXQDataAreaId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.backgroundId] forKey:kZBXQDataBackgroundId];
    NSMutableArray *tempArrayForHotWord = [NSMutableArray array];
    for (NSObject *subArrayObject in self.hotWord) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHotWord addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHotWord addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHotWord] forKey:kZBXQDataHotWord];
    [mutableDict setValue:[NSNumber numberWithDouble:self.msgLength] forKey:kZBXQDataMsgLength];
    [mutableDict setValue:self.face forKey:kZBXQDataFace];
    [mutableDict setValue:[NSNumber numberWithDouble:self.attention] forKey:kZBXQDataAttention];
    [mutableDict setValue:[NSNumber numberWithDouble:self.masterLevel] forKey:kZBXQDataMasterLevel];
    [mutableDict setValue:[NSNumber numberWithDouble:self.guardNotice] forKey:kZBXQDataGuardNotice];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isAttention] forKey:kZBXQDataIsAttention];
    NSMutableArray *tempArrayForActivityGift = [NSMutableArray array];
    for (NSObject *subArrayObject in self.activityGift) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForActivityGift addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForActivityGift addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForActivityGift] forKey:kZBXQDataActivityGift];
    [mutableDict setValue:self.title forKey:kZBXQDataTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.msgColor] forKey:kZBXQDataMsgColor];
    [mutableDict setValue:self.prepare forKey:kZBXQDataPrepare];
    [mutableDict setValue:[NSNumber numberWithDouble:self.masterLevelColor] forKey:kZBXQDataMasterLevelColor];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.cmt = [aDecoder decodeObjectForKey:kZBXQDataCmt];
    self.toplist = [aDecoder decodeObjectForKey:kZBXQDataToplist];
    self.cmtPort = [aDecoder decodeDoubleForKey:kZBXQDataCmtPort];
    self.isadmin = [aDecoder decodeDoubleForKey:kZBXQDataIsadmin];
    self.roomId = [aDecoder decodeDoubleForKey:kZBXQDataRoomId];
    self.uname = [aDecoder decodeObjectForKey:kZBXQDataUname];
    self.activityId = [aDecoder decodeDoubleForKey:kZBXQDataActivityId];
    self.cmtPortGoim = [aDecoder decodeDoubleForKey:kZBXQDataCmtPortGoim];
    self.opentime = [aDecoder decodeDoubleForKey:kZBXQDataOpentime];
    self.schId = [aDecoder decodeDoubleForKey:kZBXQDataSchId];
    self.checkVersion = [aDecoder decodeDoubleForKey:kZBXQDataCheckVersion];
    self.isvip = [aDecoder decodeDoubleForKey:kZBXQDataIsvip];
    self.meta = [aDecoder decodeObjectForKey:kZBXQDataMeta];
    self.create = [aDecoder decodeDoubleForKey:kZBXQDataCreate];
    self.createAt = [aDecoder decodeObjectForKey:kZBXQDataCreateAt];
    self.schedule = [aDecoder decodeObjectForKey:kZBXQDataSchedule];
    self.cover = [aDecoder decodeObjectForKey:kZBXQDataCover];
    self.area = [aDecoder decodeObjectForKey:kZBXQDataArea];
    self.mFace = [aDecoder decodeObjectForKey:kZBXQDataMFace];
    self.broadcastType = [aDecoder decodeDoubleForKey:kZBXQDataBroadcastType];
    self.roomgifts = [aDecoder decodeObjectForKey:kZBXQDataRoomgifts];
    self.ignoreGift = [aDecoder decodeObjectForKey:kZBXQDataIgnoreGift];
    self.guardLevel = [aDecoder decodeDoubleForKey:kZBXQDataGuardLevel];
    self.status = [aDecoder decodeObjectForKey:kZBXQDataStatus];
    self.online = [aDecoder decodeDoubleForKey:kZBXQDataOnline];
    self.guardInfo = [aDecoder decodeObjectForKey:kZBXQDataGuardInfo];
    self.msgMode = [aDecoder decodeDoubleForKey:kZBXQDataMsgMode];
    self.recommend = [aDecoder decodeObjectForKey:kZBXQDataRecommend];
    self.eventCorner = [aDecoder decodeObjectForKey:kZBXQDataEventCorner];
    self.mid = [aDecoder decodeDoubleForKey:kZBXQDataMid];
    self.areaId = [aDecoder decodeDoubleForKey:kZBXQDataAreaId];
    self.backgroundId = [aDecoder decodeDoubleForKey:kZBXQDataBackgroundId];
    self.hotWord = [aDecoder decodeObjectForKey:kZBXQDataHotWord];
    self.msgLength = [aDecoder decodeDoubleForKey:kZBXQDataMsgLength];
    self.face = [aDecoder decodeObjectForKey:kZBXQDataFace];
    self.attention = [aDecoder decodeDoubleForKey:kZBXQDataAttention];
    self.masterLevel = [aDecoder decodeDoubleForKey:kZBXQDataMasterLevel];
    self.guardNotice = [aDecoder decodeDoubleForKey:kZBXQDataGuardNotice];
    self.isAttention = [aDecoder decodeDoubleForKey:kZBXQDataIsAttention];
    self.activityGift = [aDecoder decodeObjectForKey:kZBXQDataActivityGift];
    self.title = [aDecoder decodeObjectForKey:kZBXQDataTitle];
    self.msgColor = [aDecoder decodeDoubleForKey:kZBXQDataMsgColor];
    self.prepare = [aDecoder decodeObjectForKey:kZBXQDataPrepare];
    self.masterLevelColor = [aDecoder decodeDoubleForKey:kZBXQDataMasterLevelColor];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cmt forKey:kZBXQDataCmt];
    [aCoder encodeObject:_toplist forKey:kZBXQDataToplist];
    [aCoder encodeDouble:_cmtPort forKey:kZBXQDataCmtPort];
    [aCoder encodeDouble:_isadmin forKey:kZBXQDataIsadmin];
    [aCoder encodeDouble:_roomId forKey:kZBXQDataRoomId];
    [aCoder encodeObject:_uname forKey:kZBXQDataUname];
    [aCoder encodeDouble:_activityId forKey:kZBXQDataActivityId];
    [aCoder encodeDouble:_cmtPortGoim forKey:kZBXQDataCmtPortGoim];
    [aCoder encodeDouble:_opentime forKey:kZBXQDataOpentime];
    [aCoder encodeDouble:_schId forKey:kZBXQDataSchId];
    [aCoder encodeDouble:_checkVersion forKey:kZBXQDataCheckVersion];
    [aCoder encodeDouble:_isvip forKey:kZBXQDataIsvip];
    [aCoder encodeObject:_meta forKey:kZBXQDataMeta];
    [aCoder encodeDouble:_create forKey:kZBXQDataCreate];
    [aCoder encodeObject:_createAt forKey:kZBXQDataCreateAt];
    [aCoder encodeObject:_schedule forKey:kZBXQDataSchedule];
    [aCoder encodeObject:_cover forKey:kZBXQDataCover];
    [aCoder encodeObject:_area forKey:kZBXQDataArea];
    [aCoder encodeObject:_mFace forKey:kZBXQDataMFace];
    [aCoder encodeDouble:_broadcastType forKey:kZBXQDataBroadcastType];
    [aCoder encodeObject:_roomgifts forKey:kZBXQDataRoomgifts];
    [aCoder encodeObject:_ignoreGift forKey:kZBXQDataIgnoreGift];
    [aCoder encodeDouble:_guardLevel forKey:kZBXQDataGuardLevel];
    [aCoder encodeObject:_status forKey:kZBXQDataStatus];
    [aCoder encodeDouble:_online forKey:kZBXQDataOnline];
    [aCoder encodeObject:_guardInfo forKey:kZBXQDataGuardInfo];
    [aCoder encodeDouble:_msgMode forKey:kZBXQDataMsgMode];
    [aCoder encodeObject:_recommend forKey:kZBXQDataRecommend];
    [aCoder encodeObject:_eventCorner forKey:kZBXQDataEventCorner];
    [aCoder encodeDouble:_mid forKey:kZBXQDataMid];
    [aCoder encodeDouble:_areaId forKey:kZBXQDataAreaId];
    [aCoder encodeDouble:_backgroundId forKey:kZBXQDataBackgroundId];
    [aCoder encodeObject:_hotWord forKey:kZBXQDataHotWord];
    [aCoder encodeDouble:_msgLength forKey:kZBXQDataMsgLength];
    [aCoder encodeObject:_face forKey:kZBXQDataFace];
    [aCoder encodeDouble:_attention forKey:kZBXQDataAttention];
    [aCoder encodeDouble:_masterLevel forKey:kZBXQDataMasterLevel];
    [aCoder encodeDouble:_guardNotice forKey:kZBXQDataGuardNotice];
    [aCoder encodeDouble:_isAttention forKey:kZBXQDataIsAttention];
    [aCoder encodeObject:_activityGift forKey:kZBXQDataActivityGift];
    [aCoder encodeObject:_title forKey:kZBXQDataTitle];
    [aCoder encodeDouble:_msgColor forKey:kZBXQDataMsgColor];
    [aCoder encodeObject:_prepare forKey:kZBXQDataPrepare];
    [aCoder encodeDouble:_masterLevelColor forKey:kZBXQDataMasterLevelColor];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBXQData *copy = [[ZBXQData alloc] init];
    
    if (copy) {

        copy.cmt = [self.cmt copyWithZone:zone];
        copy.toplist = [self.toplist copyWithZone:zone];
        copy.cmtPort = self.cmtPort;
        copy.isadmin = self.isadmin;
        copy.roomId = self.roomId;
        copy.uname = [self.uname copyWithZone:zone];
        copy.activityId = self.activityId;
        copy.cmtPortGoim = self.cmtPortGoim;
        copy.opentime = self.opentime;
        copy.schId = self.schId;
        copy.checkVersion = self.checkVersion;
        copy.isvip = self.isvip;
        copy.meta = [self.meta copyWithZone:zone];
        copy.create = self.create;
        copy.createAt = [self.createAt copyWithZone:zone];
        copy.schedule = [self.schedule copyWithZone:zone];
        copy.cover = [self.cover copyWithZone:zone];
        copy.area = [self.area copyWithZone:zone];
        copy.mFace = [self.mFace copyWithZone:zone];
        copy.broadcastType = self.broadcastType;
        copy.roomgifts = [self.roomgifts copyWithZone:zone];
        copy.ignoreGift = [self.ignoreGift copyWithZone:zone];
        copy.guardLevel = self.guardLevel;
        copy.status = [self.status copyWithZone:zone];
        copy.online = self.online;
        copy.guardInfo = [self.guardInfo copyWithZone:zone];
        copy.msgMode = self.msgMode;
        copy.recommend = [self.recommend copyWithZone:zone];
        copy.eventCorner = [self.eventCorner copyWithZone:zone];
        copy.mid = self.mid;
        copy.areaId = self.areaId;
        copy.backgroundId = self.backgroundId;
        copy.hotWord = [self.hotWord copyWithZone:zone];
        copy.msgLength = self.msgLength;
        copy.face = [self.face copyWithZone:zone];
        copy.attention = self.attention;
        copy.masterLevel = self.masterLevel;
        copy.guardNotice = self.guardNotice;
        copy.isAttention = self.isAttention;
        copy.activityGift = [self.activityGift copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.msgColor = self.msgColor;
        copy.prepare = [self.prepare copyWithZone:zone];
        copy.masterLevelColor = self.masterLevelColor;
    }
    
    return copy;
}


@end
