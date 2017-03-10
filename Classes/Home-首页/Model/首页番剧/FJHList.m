//
//  FJHList.m
//
//  Created by   on 2016/11/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FJHList.h"


NSString *const kFJHListIsFinish = @"is_finish";
NSString *const kFJHListSeasonId = @"season_id";
NSString *const kFJHListWatchingCount = @"watching_count";
NSString *const kFJHListPubTime = @"pub_time";
NSString *const kFJHListTitle = @"title";
NSString *const kFJHListFavourites = @"favourites";
NSString *const kFJHListNewestEpIndex = @"newest_ep_index";
NSString *const kFJHListCover = @"cover";
NSString *const kFJHListSeasonStatus = @"season_status";
NSString *const kFJHListLastTime = @"last_time";


@interface FJHList ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FJHList

@synthesize isFinish = _isFinish;
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
            self.isFinish = [[self objectOrNilForKey:kFJHListIsFinish fromDictionary:dict] doubleValue];
            self.seasonId = [[self objectOrNilForKey:kFJHListSeasonId fromDictionary:dict] doubleValue];
            self.watchingCount = [[self objectOrNilForKey:kFJHListWatchingCount fromDictionary:dict] doubleValue];
            self.pubTime = [[self objectOrNilForKey:kFJHListPubTime fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kFJHListTitle fromDictionary:dict];
            self.favourites = [self objectOrNilForKey:kFJHListFavourites fromDictionary:dict];
            self.newestEpIndex = [self objectOrNilForKey:kFJHListNewestEpIndex fromDictionary:dict];
            self.cover = [self objectOrNilForKey:kFJHListCover fromDictionary:dict];
            self.seasonStatus = [[self objectOrNilForKey:kFJHListSeasonStatus fromDictionary:dict] doubleValue];
            self.lastTime = [[self objectOrNilForKey:kFJHListLastTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isFinish] forKey:kFJHListIsFinish];
    [mutableDict setValue:[NSNumber numberWithDouble:self.seasonId] forKey:kFJHListSeasonId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.watchingCount] forKey:kFJHListWatchingCount];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pubTime] forKey:kFJHListPubTime];
    [mutableDict setValue:self.title forKey:kFJHListTitle];
    [mutableDict setValue:self.favourites forKey:kFJHListFavourites];
    [mutableDict setValue:self.newestEpIndex forKey:kFJHListNewestEpIndex];
    [mutableDict setValue:self.cover forKey:kFJHListCover];
    [mutableDict setValue:[NSNumber numberWithDouble:self.seasonStatus] forKey:kFJHListSeasonStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.lastTime] forKey:kFJHListLastTime];

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

    self.isFinish = [aDecoder decodeDoubleForKey:kFJHListIsFinish];
    self.seasonId = [aDecoder decodeDoubleForKey:kFJHListSeasonId];
    self.watchingCount = [aDecoder decodeDoubleForKey:kFJHListWatchingCount];
    self.pubTime = [aDecoder decodeDoubleForKey:kFJHListPubTime];
    self.title = [aDecoder decodeObjectForKey:kFJHListTitle];
    self.favourites = [aDecoder decodeObjectForKey:kFJHListFavourites];
    self.newestEpIndex = [aDecoder decodeObjectForKey:kFJHListNewestEpIndex];
    self.cover = [aDecoder decodeObjectForKey:kFJHListCover];
    self.seasonStatus = [aDecoder decodeDoubleForKey:kFJHListSeasonStatus];
    self.lastTime = [aDecoder decodeDoubleForKey:kFJHListLastTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isFinish forKey:kFJHListIsFinish];
    [aCoder encodeDouble:_seasonId forKey:kFJHListSeasonId];
    [aCoder encodeDouble:_watchingCount forKey:kFJHListWatchingCount];
    [aCoder encodeDouble:_pubTime forKey:kFJHListPubTime];
    [aCoder encodeObject:_title forKey:kFJHListTitle];
    [aCoder encodeObject:_favourites forKey:kFJHListFavourites];
    [aCoder encodeObject:_newestEpIndex forKey:kFJHListNewestEpIndex];
    [aCoder encodeObject:_cover forKey:kFJHListCover];
    [aCoder encodeDouble:_seasonStatus forKey:kFJHListSeasonStatus];
    [aCoder encodeDouble:_lastTime forKey:kFJHListLastTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    FJHList *copy = [[FJHList alloc] init];
    
    if (copy) {

        copy.isFinish = self.isFinish;
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
