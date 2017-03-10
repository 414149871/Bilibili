//
//  ZBXQRecommend.m
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBXQRecommend.h"
#import "ZBXQOwner.h"
#import "ZBXQCover.h"


NSString *const kZBXQRecommendOwner = @"owner";
NSString *const kZBXQRecommendTitle = @"title";
NSString *const kZBXQRecommendOnline = @"online";
NSString *const kZBXQRecommendCover = @"cover";
NSString *const kZBXQRecommendRoomId = @"room_id";


@interface ZBXQRecommend ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBXQRecommend

@synthesize owner = _owner;
@synthesize title = _title;
@synthesize online = _online;
@synthesize cover = _cover;
@synthesize roomId = _roomId;


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
            self.owner = [ZBXQOwner modelObjectWithDictionary:[dict objectForKey:kZBXQRecommendOwner]];
            self.title = [self objectOrNilForKey:kZBXQRecommendTitle fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kZBXQRecommendOnline fromDictionary:dict] doubleValue];
            self.cover = [ZBXQCover modelObjectWithDictionary:[dict objectForKey:kZBXQRecommendCover]];
            self.roomId = [[self objectOrNilForKey:kZBXQRecommendRoomId fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.owner dictionaryRepresentation] forKey:kZBXQRecommendOwner];
    [mutableDict setValue:self.title forKey:kZBXQRecommendTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kZBXQRecommendOnline];
    [mutableDict setValue:[self.cover dictionaryRepresentation] forKey:kZBXQRecommendCover];
    [mutableDict setValue:[NSNumber numberWithDouble:self.roomId] forKey:kZBXQRecommendRoomId];

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

    self.owner = [aDecoder decodeObjectForKey:kZBXQRecommendOwner];
    self.title = [aDecoder decodeObjectForKey:kZBXQRecommendTitle];
    self.online = [aDecoder decodeDoubleForKey:kZBXQRecommendOnline];
    self.cover = [aDecoder decodeObjectForKey:kZBXQRecommendCover];
    self.roomId = [aDecoder decodeDoubleForKey:kZBXQRecommendRoomId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_owner forKey:kZBXQRecommendOwner];
    [aCoder encodeObject:_title forKey:kZBXQRecommendTitle];
    [aCoder encodeDouble:_online forKey:kZBXQRecommendOnline];
    [aCoder encodeObject:_cover forKey:kZBXQRecommendCover];
    [aCoder encodeDouble:_roomId forKey:kZBXQRecommendRoomId];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBXQRecommend *copy = [[ZBXQRecommend alloc] init];
    
    if (copy) {

        copy.owner = [self.owner copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.online = self.online;
        copy.cover = [self.cover copyWithZone:zone];
        copy.roomId = self.roomId;
    }
    
    return copy;
}


@end
