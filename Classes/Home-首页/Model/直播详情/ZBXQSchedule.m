//
//  ZBXQSchedule.m
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBXQSchedule.h"


NSString *const kZBXQScheduleStreamId = @"stream_id";
NSString *const kZBXQScheduleStart = @"start";
NSString *const kZBXQScheduleMid = @"mid";
NSString *const kZBXQScheduleManager = @"manager";
NSString *const kZBXQScheduleSchId = @"sch_id";
NSString *const kZBXQScheduleCid = @"cid";
NSString *const kZBXQScheduleTitle = @"title";
NSString *const kZBXQScheduleMetaId = @"meta_id";
NSString *const kZBXQScheduleStartAt = @"start_at";
NSString *const kZBXQSchedulePendingMetaId = @"pending_meta_id";
NSString *const kZBXQScheduleOnline = @"online";
NSString *const kZBXQScheduleAid = @"aid";
NSString *const kZBXQScheduleStatus = @"status";


@interface ZBXQSchedule ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBXQSchedule

@synthesize streamId = _streamId;
@synthesize start = _start;
@synthesize mid = _mid;
@synthesize manager = _manager;
@synthesize schId = _schId;
@synthesize cid = _cid;
@synthesize title = _title;
@synthesize metaId = _metaId;
@synthesize startAt = _startAt;
@synthesize pendingMetaId = _pendingMetaId;
@synthesize online = _online;
@synthesize aid = _aid;
@synthesize status = _status;


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
            self.streamId = [[self objectOrNilForKey:kZBXQScheduleStreamId fromDictionary:dict] doubleValue];
            self.start = [[self objectOrNilForKey:kZBXQScheduleStart fromDictionary:dict] doubleValue];
            self.mid = [[self objectOrNilForKey:kZBXQScheduleMid fromDictionary:dict] doubleValue];
            self.manager = [self objectOrNilForKey:kZBXQScheduleManager fromDictionary:dict];
            self.schId = [[self objectOrNilForKey:kZBXQScheduleSchId fromDictionary:dict] doubleValue];
            self.cid = [[self objectOrNilForKey:kZBXQScheduleCid fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kZBXQScheduleTitle fromDictionary:dict];
            self.metaId = [[self objectOrNilForKey:kZBXQScheduleMetaId fromDictionary:dict] doubleValue];
            self.startAt = [self objectOrNilForKey:kZBXQScheduleStartAt fromDictionary:dict];
            self.pendingMetaId = [[self objectOrNilForKey:kZBXQSchedulePendingMetaId fromDictionary:dict] doubleValue];
            self.online = [[self objectOrNilForKey:kZBXQScheduleOnline fromDictionary:dict] doubleValue];
            self.aid = [[self objectOrNilForKey:kZBXQScheduleAid fromDictionary:dict] doubleValue];
            self.status = [self objectOrNilForKey:kZBXQScheduleStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.streamId] forKey:kZBXQScheduleStreamId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.start] forKey:kZBXQScheduleStart];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mid] forKey:kZBXQScheduleMid];
    NSMutableArray *tempArrayForManager = [NSMutableArray array];
    for (NSObject *subArrayObject in self.manager) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForManager addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForManager addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForManager] forKey:kZBXQScheduleManager];
    [mutableDict setValue:[NSNumber numberWithDouble:self.schId] forKey:kZBXQScheduleSchId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.cid] forKey:kZBXQScheduleCid];
    [mutableDict setValue:self.title forKey:kZBXQScheduleTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.metaId] forKey:kZBXQScheduleMetaId];
    [mutableDict setValue:self.startAt forKey:kZBXQScheduleStartAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pendingMetaId] forKey:kZBXQSchedulePendingMetaId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kZBXQScheduleOnline];
    [mutableDict setValue:[NSNumber numberWithDouble:self.aid] forKey:kZBXQScheduleAid];
    [mutableDict setValue:self.status forKey:kZBXQScheduleStatus];

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

    self.streamId = [aDecoder decodeDoubleForKey:kZBXQScheduleStreamId];
    self.start = [aDecoder decodeDoubleForKey:kZBXQScheduleStart];
    self.mid = [aDecoder decodeDoubleForKey:kZBXQScheduleMid];
    self.manager = [aDecoder decodeObjectForKey:kZBXQScheduleManager];
    self.schId = [aDecoder decodeDoubleForKey:kZBXQScheduleSchId];
    self.cid = [aDecoder decodeDoubleForKey:kZBXQScheduleCid];
    self.title = [aDecoder decodeObjectForKey:kZBXQScheduleTitle];
    self.metaId = [aDecoder decodeDoubleForKey:kZBXQScheduleMetaId];
    self.startAt = [aDecoder decodeObjectForKey:kZBXQScheduleStartAt];
    self.pendingMetaId = [aDecoder decodeDoubleForKey:kZBXQSchedulePendingMetaId];
    self.online = [aDecoder decodeDoubleForKey:kZBXQScheduleOnline];
    self.aid = [aDecoder decodeDoubleForKey:kZBXQScheduleAid];
    self.status = [aDecoder decodeObjectForKey:kZBXQScheduleStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_streamId forKey:kZBXQScheduleStreamId];
    [aCoder encodeDouble:_start forKey:kZBXQScheduleStart];
    [aCoder encodeDouble:_mid forKey:kZBXQScheduleMid];
    [aCoder encodeObject:_manager forKey:kZBXQScheduleManager];
    [aCoder encodeDouble:_schId forKey:kZBXQScheduleSchId];
    [aCoder encodeDouble:_cid forKey:kZBXQScheduleCid];
    [aCoder encodeObject:_title forKey:kZBXQScheduleTitle];
    [aCoder encodeDouble:_metaId forKey:kZBXQScheduleMetaId];
    [aCoder encodeObject:_startAt forKey:kZBXQScheduleStartAt];
    [aCoder encodeDouble:_pendingMetaId forKey:kZBXQSchedulePendingMetaId];
    [aCoder encodeDouble:_online forKey:kZBXQScheduleOnline];
    [aCoder encodeDouble:_aid forKey:kZBXQScheduleAid];
    [aCoder encodeObject:_status forKey:kZBXQScheduleStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBXQSchedule *copy = [[ZBXQSchedule alloc] init];
    
    if (copy) {

        copy.streamId = self.streamId;
        copy.start = self.start;
        copy.mid = self.mid;
        copy.manager = [self.manager copyWithZone:zone];
        copy.schId = self.schId;
        copy.cid = self.cid;
        copy.title = [self.title copyWithZone:zone];
        copy.metaId = self.metaId;
        copy.startAt = [self.startAt copyWithZone:zone];
        copy.pendingMetaId = self.pendingMetaId;
        copy.online = self.online;
        copy.aid = self.aid;
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
