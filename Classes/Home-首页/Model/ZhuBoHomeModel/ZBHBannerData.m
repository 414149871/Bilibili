//
//  ZBHBannerData.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBHBannerData.h"
#import "ZBHOwner.h"
#import "ZBHCover.h"


NSString *const kZBHBannerDataRoomId = @"room_id";
NSString *const kZBHBannerDataAcceptQuality = @"accept_quality";
NSString *const kZBHBannerDataOwner = @"owner";
NSString *const kZBHBannerDataArea = @"area";
NSString *const kZBHBannerDataCheckVersion = @"check_version";
NSString *const kZBHBannerDataAreaId = @"area_id";
NSString *const kZBHBannerDataTitle = @"title";
NSString *const kZBHBannerDataIsTv = @"is_tv";
NSString *const kZBHBannerDataCover = @"cover";
NSString *const kZBHBannerDataPlayurl = @"playurl";
NSString *const kZBHBannerDataOnline = @"online";
NSString *const kZBHBannerDataBroadcastType = @"broadcast_type";


@interface ZBHBannerData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBHBannerData

@synthesize roomId = _roomId;
@synthesize acceptQuality = _acceptQuality;
@synthesize owner = _owner;
@synthesize area = _area;
@synthesize checkVersion = _checkVersion;
@synthesize areaId = _areaId;
@synthesize title = _title;
@synthesize isTv = _isTv;
@synthesize cover = _cover;
@synthesize playurl = _playurl;
@synthesize online = _online;
@synthesize broadcastType = _broadcastType;


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
            self.roomId = [[self objectOrNilForKey:kZBHBannerDataRoomId fromDictionary:dict] doubleValue];
            self.acceptQuality = [self objectOrNilForKey:kZBHBannerDataAcceptQuality fromDictionary:dict];
            self.owner = [ZBHOwner modelObjectWithDictionary:[dict objectForKey:kZBHBannerDataOwner]];
            self.area = [self objectOrNilForKey:kZBHBannerDataArea fromDictionary:dict];
            self.checkVersion = [[self objectOrNilForKey:kZBHBannerDataCheckVersion fromDictionary:dict] doubleValue];
            self.areaId = [[self objectOrNilForKey:kZBHBannerDataAreaId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kZBHBannerDataTitle fromDictionary:dict];
            self.isTv = [[self objectOrNilForKey:kZBHBannerDataIsTv fromDictionary:dict] doubleValue];
            self.cover = [ZBHCover modelObjectWithDictionary:[dict objectForKey:kZBHBannerDataCover]];
            self.playurl = [self objectOrNilForKey:kZBHBannerDataPlayurl fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kZBHBannerDataOnline fromDictionary:dict] doubleValue];
            self.broadcastType = [[self objectOrNilForKey:kZBHBannerDataBroadcastType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.roomId] forKey:kZBHBannerDataRoomId];
    [mutableDict setValue:self.acceptQuality forKey:kZBHBannerDataAcceptQuality];
    [mutableDict setValue:[self.owner dictionaryRepresentation] forKey:kZBHBannerDataOwner];
    [mutableDict setValue:self.area forKey:kZBHBannerDataArea];
    [mutableDict setValue:[NSNumber numberWithDouble:self.checkVersion] forKey:kZBHBannerDataCheckVersion];
    [mutableDict setValue:[NSNumber numberWithDouble:self.areaId] forKey:kZBHBannerDataAreaId];
    [mutableDict setValue:self.title forKey:kZBHBannerDataTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isTv] forKey:kZBHBannerDataIsTv];
    [mutableDict setValue:[self.cover dictionaryRepresentation] forKey:kZBHBannerDataCover];
    [mutableDict setValue:self.playurl forKey:kZBHBannerDataPlayurl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kZBHBannerDataOnline];
    [mutableDict setValue:[NSNumber numberWithDouble:self.broadcastType] forKey:kZBHBannerDataBroadcastType];

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

    self.roomId = [aDecoder decodeDoubleForKey:kZBHBannerDataRoomId];
    self.acceptQuality = [aDecoder decodeObjectForKey:kZBHBannerDataAcceptQuality];
    self.owner = [aDecoder decodeObjectForKey:kZBHBannerDataOwner];
    self.area = [aDecoder decodeObjectForKey:kZBHBannerDataArea];
    self.checkVersion = [aDecoder decodeDoubleForKey:kZBHBannerDataCheckVersion];
    self.areaId = [aDecoder decodeDoubleForKey:kZBHBannerDataAreaId];
    self.title = [aDecoder decodeObjectForKey:kZBHBannerDataTitle];
    self.isTv = [aDecoder decodeDoubleForKey:kZBHBannerDataIsTv];
    self.cover = [aDecoder decodeObjectForKey:kZBHBannerDataCover];
    self.playurl = [aDecoder decodeObjectForKey:kZBHBannerDataPlayurl];
    self.online = [aDecoder decodeDoubleForKey:kZBHBannerDataOnline];
    self.broadcastType = [aDecoder decodeDoubleForKey:kZBHBannerDataBroadcastType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_roomId forKey:kZBHBannerDataRoomId];
    [aCoder encodeObject:_acceptQuality forKey:kZBHBannerDataAcceptQuality];
    [aCoder encodeObject:_owner forKey:kZBHBannerDataOwner];
    [aCoder encodeObject:_area forKey:kZBHBannerDataArea];
    [aCoder encodeDouble:_checkVersion forKey:kZBHBannerDataCheckVersion];
    [aCoder encodeDouble:_areaId forKey:kZBHBannerDataAreaId];
    [aCoder encodeObject:_title forKey:kZBHBannerDataTitle];
    [aCoder encodeDouble:_isTv forKey:kZBHBannerDataIsTv];
    [aCoder encodeObject:_cover forKey:kZBHBannerDataCover];
    [aCoder encodeObject:_playurl forKey:kZBHBannerDataPlayurl];
    [aCoder encodeDouble:_online forKey:kZBHBannerDataOnline];
    [aCoder encodeDouble:_broadcastType forKey:kZBHBannerDataBroadcastType];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBHBannerData *copy = [[ZBHBannerData alloc] init];
    
    if (copy) {

        copy.roomId = self.roomId;
        copy.acceptQuality = [self.acceptQuality copyWithZone:zone];
        copy.owner = [self.owner copyWithZone:zone];
        copy.area = [self.area copyWithZone:zone];
        copy.checkVersion = self.checkVersion;
        copy.areaId = self.areaId;
        copy.title = [self.title copyWithZone:zone];
        copy.isTv = self.isTv;
        copy.cover = [self.cover copyWithZone:zone];
        copy.playurl = [self.playurl copyWithZone:zone];
        copy.online = self.online;
        copy.broadcastType = self.broadcastType;
    }
    
    return copy;
}


@end
