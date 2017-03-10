//
//  FJHSerializing.m
//
//  Created by   on 2016/11/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FJHSerializing.h"


NSString *const kFJHSerializingIsFinish = @"is_finish";
NSString *const kFJHSerializingIsStarted = @"is_started";
NSString *const kFJHSerializingSeasonId = @"season_id";
NSString *const kFJHSerializingWatchingCount = @"watching_count";
NSString *const kFJHSerializingPubTime = @"pub_time";
NSString *const kFJHSerializingTitle = @"title";
NSString *const kFJHSerializingFavourites = @"favourites";
NSString *const kFJHSerializingNewestEpIndex = @"newest_ep_index";
NSString *const kFJHSerializingCover = @"cover";
NSString *const kFJHSerializingSeasonStatus = @"season_status";
NSString *const kFJHSerializingLastTime = @"last_time";


@interface FJHSerializing ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FJHSerializing

@synthesize isFinish = _isFinish;
@synthesize isStarted = _isStarted;
@synthesize seasonId = _seasonId;
@synthesize watchingCount = _watchingCount;
@synthesize pubTime = _pubTime;
@synthesize title = _title;
@synthesize favourites = _favourites;
@synthesize newestEpIndex = _newestEpIndex;
@synthesize cover = _cover;
@synthesize seasonStatus = _seasonStatus;
@synthesize lastTime = _lastTime;


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
            self.isFinish = [[self objectOrNilForKey:kFJHSerializingIsFinish fromDictionary:dict] doubleValue];
            self.isStarted = [[self objectOrNilForKey:kFJHSerializingIsStarted fromDictionary:dict] doubleValue];
            self.seasonId = [[self objectOrNilForKey:kFJHSerializingSeasonId fromDictionary:dict] doubleValue];
            self.watchingCount = [[self objectOrNilForKey:kFJHSerializingWatchingCount fromDictionary:dict] doubleValue];
            self.pubTime = [[self objectOrNilForKey:kFJHSerializingPubTime fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kFJHSerializingTitle fromDictionary:dict];
            self.favourites = [self objectOrNilForKey:kFJHSerializingFavourites fromDictionary:dict];
            self.newestEpIndex = [self objectOrNilForKey:kFJHSerializingNewestEpIndex fromDictionary:dict];
            self.cover = [self objectOrNilForKey:kFJHSerializingCover fromDictionary:dict];
            self.seasonStatus = [[self objectOrNilForKey:kFJHSerializingSeasonStatus fromDictionary:dict] doubleValue];
            self.lastTime = [[self objectOrNilForKey:kFJHSerializingLastTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFinish] forKey:kFJHSerializingIsFinish];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isStarted] forKey:kFJHSerializingIsStarted];
    [mutableDict setValue:[NSNumber numberWithDouble:self.seasonId] forKey:kFJHSerializingSeasonId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.watchingCount] forKey:kFJHSerializingWatchingCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pubTime] forKey:kFJHSerializingPubTime];
    [mutableDict setValue:self.title forKey:kFJHSerializingTitle];
    [mutableDict setValue:self.favourites forKey:kFJHSerializingFavourites];
    [mutableDict setValue:self.newestEpIndex forKey:kFJHSerializingNewestEpIndex];
    [mutableDict setValue:self.cover forKey:kFJHSerializingCover];
    [mutableDict setValue:[NSNumber numberWithDouble:self.seasonStatus] forKey:kFJHSerializingSeasonStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastTime] forKey:kFJHSerializingLastTime];

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

    self.isFinish = [aDecoder decodeDoubleForKey:kFJHSerializingIsFinish];
    self.isStarted = [aDecoder decodeDoubleForKey:kFJHSerializingIsStarted];
    self.seasonId = [aDecoder decodeDoubleForKey:kFJHSerializingSeasonId];
    self.watchingCount = [aDecoder decodeDoubleForKey:kFJHSerializingWatchingCount];
    self.pubTime = [aDecoder decodeDoubleForKey:kFJHSerializingPubTime];
    self.title = [aDecoder decodeObjectForKey:kFJHSerializingTitle];
    self.favourites = [aDecoder decodeObjectForKey:kFJHSerializingFavourites];
    self.newestEpIndex = [aDecoder decodeObjectForKey:kFJHSerializingNewestEpIndex];
    self.cover = [aDecoder decodeObjectForKey:kFJHSerializingCover];
    self.seasonStatus = [aDecoder decodeDoubleForKey:kFJHSerializingSeasonStatus];
    self.lastTime = [aDecoder decodeDoubleForKey:kFJHSerializingLastTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isFinish forKey:kFJHSerializingIsFinish];
    [aCoder encodeDouble:_isStarted forKey:kFJHSerializingIsStarted];
    [aCoder encodeDouble:_seasonId forKey:kFJHSerializingSeasonId];
    [aCoder encodeDouble:_watchingCount forKey:kFJHSerializingWatchingCount];
    [aCoder encodeDouble:_pubTime forKey:kFJHSerializingPubTime];
    [aCoder encodeObject:_title forKey:kFJHSerializingTitle];
    [aCoder encodeObject:_favourites forKey:kFJHSerializingFavourites];
    [aCoder encodeObject:_newestEpIndex forKey:kFJHSerializingNewestEpIndex];
    [aCoder encodeObject:_cover forKey:kFJHSerializingCover];
    [aCoder encodeDouble:_seasonStatus forKey:kFJHSerializingSeasonStatus];
    [aCoder encodeDouble:_lastTime forKey:kFJHSerializingLastTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    FJHSerializing *copy = [[FJHSerializing alloc] init];
    
    if (copy) {

        copy.isFinish = self.isFinish;
        copy.isStarted = self.isStarted;
        copy.seasonId = self.seasonId;
        copy.watchingCount = self.watchingCount;
        copy.pubTime = self.pubTime;
        copy.title = [self.title copyWithZone:zone];
        copy.favourites = [self.favourites copyWithZone:zone];
        copy.newestEpIndex = [self.newestEpIndex copyWithZone:zone];
        copy.cover = [self.cover copyWithZone:zone];
        copy.seasonStatus = self.seasonStatus;
        copy.lastTime = self.lastTime;
    }
    
    return copy;
}


@end
