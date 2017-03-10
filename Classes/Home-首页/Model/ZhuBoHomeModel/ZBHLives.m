//
//  ZBHLives.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBHLives.h"
#import "ZBHOwner.h"
#import "ZBHCover.h"


NSString *const kZBHLivesRoomId = @"room_id";
NSString *const kZBHLivesAcceptQuality = @"accept_quality";
NSString *const kZBHLivesOwner = @"owner";
NSString *const kZBHLivesArea = @"area";
NSString *const kZBHLivesCheckVersion = @"check_version";
NSString *const kZBHLivesAreaId = @"area_id";
NSString *const kZBHLivesTitle = @"title";
NSString *const kZBHLivesIsTv = @"is_tv";
NSString *const kZBHLivesCover = @"cover";
NSString *const kZBHLivesPlayurl = @"playurl";
NSString *const kZBHLivesOnline = @"online";
NSString *const kZBHLivesBroadcastType = @"broadcast_type";


@interface ZBHLives ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBHLives

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
            self.roomId = [[self objectOrNilForKey:kZBHLivesRoomId fromDictionary:dict] doubleValue];
            self.acceptQuality = [self objectOrNilForKey:kZBHLivesAcceptQuality fromDictionary:dict];
            self.owner = [ZBHOwner modelObjectWithDictionary:[dict objectForKey:kZBHLivesOwner]];
            self.area = [self objectOrNilForKey:kZBHLivesArea fromDictionary:dict];
            self.checkVersion = [[self objectOrNilForKey:kZBHLivesCheckVersion fromDictionary:dict] doubleValue];
            self.areaId = [[self objectOrNilForKey:kZBHLivesAreaId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kZBHLivesTitle fromDictionary:dict];
            self.isTv = [[self objectOrNilForKey:kZBHLivesIsTv fromDictionary:dict] doubleValue];
            self.cover = [ZBHCover modelObjectWithDictionary:[dict objectForKey:kZBHLivesCover]];
            self.playurl = [self objectOrNilForKey:kZBHLivesPlayurl fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kZBHLivesOnline fromDictionary:dict] doubleValue];
            self.broadcastType = [[self objectOrNilForKey:kZBHLivesBroadcastType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.roomId] forKey:kZBHLivesRoomId];
    [mutableDict setValue:self.acceptQuality forKey:kZBHLivesAcceptQuality];
    [mutableDict setValue:[self.owner dictionaryRepresentation] forKey:kZBHLivesOwner];
    [mutableDict setValue:self.area forKey:kZBHLivesArea];
    [mutableDict setValue:[NSNumber numberWithDouble:self.checkVersion] forKey:kZBHLivesCheckVersion];
    [mutableDict setValue:[NSNumber numberWithDouble:self.areaId] forKey:kZBHLivesAreaId];
    [mutableDict setValue:self.title forKey:kZBHLivesTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isTv] forKey:kZBHLivesIsTv];
    [mutableDict setValue:[self.cover dictionaryRepresentation] forKey:kZBHLivesCover];
    [mutableDict setValue:self.playurl forKey:kZBHLivesPlayurl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kZBHLivesOnline];
    [mutableDict setValue:[NSNumber numberWithDouble:self.broadcastType] forKey:kZBHLivesBroadcastType];

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

    self.roomId = [aDecoder decodeDoubleForKey:kZBHLivesRoomId];
    self.acceptQuality = [aDecoder decodeObjectForKey:kZBHLivesAcceptQuality];
    self.owner = [aDecoder decodeObjectForKey:kZBHLivesOwner];
    self.area = [aDecoder decodeObjectForKey:kZBHLivesArea];
    self.checkVersion = [aDecoder decodeDoubleForKey:kZBHLivesCheckVersion];
    self.areaId = [aDecoder decodeDoubleForKey:kZBHLivesAreaId];
    self.title = [aDecoder decodeObjectForKey:kZBHLivesTitle];
    self.isTv = [aDecoder decodeDoubleForKey:kZBHLivesIsTv];
    self.cover = [aDecoder decodeObjectForKey:kZBHLivesCover];
    self.playurl = [aDecoder decodeObjectForKey:kZBHLivesPlayurl];
    self.online = [aDecoder decodeDoubleForKey:kZBHLivesOnline];
    self.broadcastType = [aDecoder decodeDoubleForKey:kZBHLivesBroadcastType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_roomId forKey:kZBHLivesRoomId];
    [aCoder encodeObject:_acceptQuality forKey:kZBHLivesAcceptQuality];
    [aCoder encodeObject:_owner forKey:kZBHLivesOwner];
    [aCoder encodeObject:_area forKey:kZBHLivesArea];
    [aCoder encodeDouble:_checkVersion forKey:kZBHLivesCheckVersion];
    [aCoder encodeDouble:_areaId forKey:kZBHLivesAreaId];
    [aCoder encodeObject:_title forKey:kZBHLivesTitle];
    [aCoder encodeDouble:_isTv forKey:kZBHLivesIsTv];
    [aCoder encodeObject:_cover forKey:kZBHLivesCover];
    [aCoder encodeObject:_playurl forKey:kZBHLivesPlayurl];
    [aCoder encodeDouble:_online forKey:kZBHLivesOnline];
    [aCoder encodeDouble:_broadcastType forKey:kZBHLivesBroadcastType];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBHLives *copy = [[ZBHLives alloc] init];
    
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
