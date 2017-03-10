//
//  ZBXQGuardInfo.m
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBXQGuardInfo.h"


NSString *const kZBXQGuardInfoHeartStatus = @"heart_status";
NSString *const kZBXQGuardInfoHeartTime = @"heart_time";


@interface ZBXQGuardInfo ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBXQGuardInfo

@synthesize heartStatus = _heartStatus;
@synthesize heartTime = _heartTime;


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
            self.heartStatus = [[self objectOrNilForKey:kZBXQGuardInfoHeartStatus fromDictionary:dict] doubleValue];
            self.heartTime = [[self objectOrNilForKey:kZBXQGuardInfoHeartTime fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.heartStatus] forKey:kZBXQGuardInfoHeartStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.heartTime] forKey:kZBXQGuardInfoHeartTime];

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

    self.heartStatus = [aDecoder decodeDoubleForKey:kZBXQGuardInfoHeartStatus];
    self.heartTime = [aDecoder decodeDoubleForKey:kZBXQGuardInfoHeartTime];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_heartStatus forKey:kZBXQGuardInfoHeartStatus];
    [aCoder encodeDouble:_heartTime forKey:kZBXQGuardInfoHeartTime];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBXQGuardInfo *copy = [[ZBXQGuardInfo alloc] init];
    
    if (copy) {

        copy.heartStatus = self.heartStatus;
        copy.heartTime = self.heartTime;
    }
    
    return copy;
}


@end
