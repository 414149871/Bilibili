//
//  Body.m
//
//  Created by   on 2016/10/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Body.h"


NSString *const kBodyPlay = @"play";
NSString *const kBodyStatus = @"status";
NSString *const kBodyParam = @"param";
NSString *const kBodyIndex = @"index";
NSString *const kBodyUri = @"uri";
NSString *const kBodyArea = @"area";
NSString *const kBodyGoto = @"goto";
NSString *const kBodyAreaId = @"area_id";
NSString *const kBodyTitle = @"title";
NSString *const kBodyDanmaku = @"danmaku";
NSString *const kBodyCover = @"cover";
NSString *const kBodyMtime = @"mtime";
NSString *const kBodyOnline = @"online";
NSString *const kBodyName = @"name";
NSString *const kBodyFace = @"face";


@interface Body ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Body

@synthesize play = _play;
@synthesize status = _status;
@synthesize param = _param;
@synthesize index = _index;
@synthesize uri = _uri;
@synthesize area = _area;
@synthesize gotoProperty = _gotoProperty;
@synthesize areaId = _areaId;
@synthesize title = _title;
@synthesize danmaku = _danmaku;
@synthesize cover = _cover;
@synthesize mtime = _mtime;
@synthesize online = _online;
@synthesize name = _name;
@synthesize face = _face;


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
            self.play = [[self objectOrNilForKey:kBodyPlay fromDictionary:dict] doubleValue];
            self.status = [[self objectOrNilForKey:kBodyStatus fromDictionary:dict] doubleValue];
            self.param = [self objectOrNilForKey:kBodyParam fromDictionary:dict];
            self.index = [self objectOrNilForKey:kBodyIndex fromDictionary:dict];
            self.uri = [self objectOrNilForKey:kBodyUri fromDictionary:dict];
            self.area = [self objectOrNilForKey:kBodyArea fromDictionary:dict];
            self.gotoProperty = [self objectOrNilForKey:kBodyGoto fromDictionary:dict];
            self.areaId = [[self objectOrNilForKey:kBodyAreaId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kBodyTitle fromDictionary:dict];
            self.danmaku = [[self objectOrNilForKey:kBodyDanmaku fromDictionary:dict] doubleValue];
            self.cover = [self objectOrNilForKey:kBodyCover fromDictionary:dict];
            self.mtime = [self objectOrNilForKey:kBodyMtime fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kBodyOnline fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kBodyName fromDictionary:dict];
            self.face = [self objectOrNilForKey:kBodyFace fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.play] forKey:kBodyPlay];
    [mutableDict setValue:[NSNumber numberWithDouble:self.status] forKey:kBodyStatus];
    [mutableDict setValue:self.param forKey:kBodyParam];
    [mutableDict setValue:self.index forKey:kBodyIndex];
    [mutableDict setValue:self.uri forKey:kBodyUri];
    [mutableDict setValue:self.area forKey:kBodyArea];
    [mutableDict setValue:self.gotoProperty forKey:kBodyGoto];
    [mutableDict setValue:[NSNumber numberWithDouble:self.areaId] forKey:kBodyAreaId];
    [mutableDict setValue:self.title forKey:kBodyTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.danmaku] forKey:kBodyDanmaku];
    [mutableDict setValue:self.cover forKey:kBodyCover];
    [mutableDict setValue:self.mtime forKey:kBodyMtime];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kBodyOnline];
    [mutableDict setValue:self.name forKey:kBodyName];
    [mutableDict setValue:self.face forKey:kBodyFace];

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

    self.play = [aDecoder decodeDoubleForKey:kBodyPlay];
    self.status = [aDecoder decodeDoubleForKey:kBodyStatus];
    self.param = [aDecoder decodeObjectForKey:kBodyParam];
    self.index = [aDecoder decodeObjectForKey:kBodyIndex];
    self.uri = [aDecoder decodeObjectForKey:kBodyUri];
    self.area = [aDecoder decodeObjectForKey:kBodyArea];
    self.gotoProperty = [aDecoder decodeObjectForKey:kBodyGoto];
    self.areaId = [aDecoder decodeDoubleForKey:kBodyAreaId];
    self.title = [aDecoder decodeObjectForKey:kBodyTitle];
    self.danmaku = [aDecoder decodeDoubleForKey:kBodyDanmaku];
    self.cover = [aDecoder decodeObjectForKey:kBodyCover];
    self.mtime = [aDecoder decodeObjectForKey:kBodyMtime];
    self.online = [aDecoder decodeDoubleForKey:kBodyOnline];
    self.name = [aDecoder decodeObjectForKey:kBodyName];
    self.face = [aDecoder decodeObjectForKey:kBodyFace];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_play forKey:kBodyPlay];
    [aCoder encodeDouble:_status forKey:kBodyStatus];
    [aCoder encodeObject:_param forKey:kBodyParam];
    [aCoder encodeObject:_index forKey:kBodyIndex];
    [aCoder encodeObject:_uri forKey:kBodyUri];
    [aCoder encodeObject:_area forKey:kBodyArea];
    [aCoder encodeObject:_gotoProperty forKey:kBodyGoto];
    [aCoder encodeDouble:_areaId forKey:kBodyAreaId];
    [aCoder encodeObject:_title forKey:kBodyTitle];
    [aCoder encodeDouble:_danmaku forKey:kBodyDanmaku];
    [aCoder encodeObject:_cover forKey:kBodyCover];
    [aCoder encodeObject:_mtime forKey:kBodyMtime];
    [aCoder encodeDouble:_online forKey:kBodyOnline];
    [aCoder encodeObject:_name forKey:kBodyName];
    [aCoder encodeObject:_face forKey:kBodyFace];
}

- (id)copyWithZone:(NSZone *)zone
{
    Body *copy = [[Body alloc] init];
    
    if (copy) {

        copy.play = self.play;
        copy.status = self.status;
        copy.param = [self.param copyWithZone:zone];
        copy.index = [self.index copyWithZone:zone];
        copy.uri = [self.uri copyWithZone:zone];
        copy.area = [self.area copyWithZone:zone];
        copy.gotoProperty = [self.gotoProperty copyWithZone:zone];
        copy.areaId = self.areaId;
        copy.title = [self.title copyWithZone:zone];
        copy.danmaku = self.danmaku;
        copy.cover = [self.cover copyWithZone:zone];
        copy.mtime = [self.mtime copyWithZone:zone];
        copy.online = self.online;
        copy.name = [self.name copyWithZone:zone];
        copy.face = [self.face copyWithZone:zone];
    }
    
    return copy;
}


@end
