//
//  NRDLives.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NRDLives.h"
#import "NRDOwner.h"
#import "NRDCover.h"


NSString *const kNRDLivesRoomId = @"room_id";
NSString *const kNRDLivesAcceptQuality = @"accept_quality";
NSString *const kNRDLivesOwner = @"owner";
NSString *const kNRDLivesArea = @"area";
NSString *const kNRDLivesCheckVersion = @"check_version";
NSString *const kNRDLivesAreaId = @"area_id";
NSString *const kNRDLivesTitle = @"title";
NSString *const kNRDLivesIsTv = @"is_tv";
NSString *const kNRDLivesCover = @"cover";
NSString *const kNRDLivesPlayurl = @"playurl";
NSString *const kNRDLivesOnline = @"online";
NSString *const kNRDLivesBroadcastType = @"broadcast_type";


@interface NRDLives ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NRDLives

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
            self.roomId = [[self objectOrNilForKey:kNRDLivesRoomId fromDictionary:dict] doubleValue];
            self.acceptQuality = [self objectOrNilForKey:kNRDLivesAcceptQuality fromDictionary:dict];
            self.owner = [NRDOwner modelObjectWithDictionary:[dict objectForKey:kNRDLivesOwner]];
            self.area = [self objectOrNilForKey:kNRDLivesArea fromDictionary:dict];
            self.checkVersion = [[self objectOrNilForKey:kNRDLivesCheckVersion fromDictionary:dict] doubleValue];
            self.areaId = [[self objectOrNilForKey:kNRDLivesAreaId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kNRDLivesTitle fromDictionary:dict];
            self.isTv = [[self objectOrNilForKey:kNRDLivesIsTv fromDictionary:dict] doubleValue];
            self.cover = [NRDCover modelObjectWithDictionary:[dict objectForKey:kNRDLivesCover]];
            self.playurl = [self objectOrNilForKey:kNRDLivesPlayurl fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kNRDLivesOnline fromDictionary:dict] doubleValue];
            self.broadcastType = [[self objectOrNilForKey:kNRDLivesBroadcastType fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.roomId] forKey:kNRDLivesRoomId];
    [mutableDict setValue:self.acceptQuality forKey:kNRDLivesAcceptQuality];
    [mutableDict setValue:[self.owner dictionaryRepresentation] forKey:kNRDLivesOwner];
    [mutableDict setValue:self.area forKey:kNRDLivesArea];
    [mutableDict setValue:[NSNumber numberWithDouble:self.checkVersion] forKey:kNRDLivesCheckVersion];
    [mutableDict setValue:[NSNumber numberWithDouble:self.areaId] forKey:kNRDLivesAreaId];
    [mutableDict setValue:self.title forKey:kNRDLivesTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isTv] forKey:kNRDLivesIsTv];
    [mutableDict setValue:[self.cover dictionaryRepresentation] forKey:kNRDLivesCover];
    [mutableDict setValue:self.playurl forKey:kNRDLivesPlayurl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kNRDLivesOnline];
    [mutableDict setValue:[NSNumber numberWithDouble:self.broadcastType] forKey:kNRDLivesBroadcastType];

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

    self.roomId = [aDecoder decodeDoubleForKey:kNRDLivesRoomId];
    self.acceptQuality = [aDecoder decodeObjectForKey:kNRDLivesAcceptQuality];
    self.owner = [aDecoder decodeObjectForKey:kNRDLivesOwner];
    self.area = [aDecoder decodeObjectForKey:kNRDLivesArea];
    self.checkVersion = [aDecoder decodeDoubleForKey:kNRDLivesCheckVersion];
    self.areaId = [aDecoder decodeDoubleForKey:kNRDLivesAreaId];
    self.title = [aDecoder decodeObjectForKey:kNRDLivesTitle];
    self.isTv = [aDecoder decodeDoubleForKey:kNRDLivesIsTv];
    self.cover = [aDecoder decodeObjectForKey:kNRDLivesCover];
    self.playurl = [aDecoder decodeObjectForKey:kNRDLivesPlayurl];
    self.online = [aDecoder decodeDoubleForKey:kNRDLivesOnline];
    self.broadcastType = [aDecoder decodeDoubleForKey:kNRDLivesBroadcastType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_roomId forKey:kNRDLivesRoomId];
    [aCoder encodeObject:_acceptQuality forKey:kNRDLivesAcceptQuality];
    [aCoder encodeObject:_owner forKey:kNRDLivesOwner];
    [aCoder encodeObject:_area forKey:kNRDLivesArea];
    [aCoder encodeDouble:_checkVersion forKey:kNRDLivesCheckVersion];
    [aCoder encodeDouble:_areaId forKey:kNRDLivesAreaId];
    [aCoder encodeObject:_title forKey:kNRDLivesTitle];
    [aCoder encodeDouble:_isTv forKey:kNRDLivesIsTv];
    [aCoder encodeObject:_cover forKey:kNRDLivesCover];
    [aCoder encodeObject:_playurl forKey:kNRDLivesPlayurl];
    [aCoder encodeDouble:_online forKey:kNRDLivesOnline];
    [aCoder encodeDouble:_broadcastType forKey:kNRDLivesBroadcastType];
}

- (id)copyWithZone:(NSZone *)zone
{
    NRDLives *copy = [[NRDLives alloc] init];
    
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
