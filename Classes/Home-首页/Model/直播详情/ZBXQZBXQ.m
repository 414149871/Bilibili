//
//  ZBXQZBXQ.m
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBXQZBXQ.h"
#import "ZBXQData.h"


NSString *const kZBXQZBXQData = @"data";
NSString *const kZBXQZBXQCode = @"code";


@interface ZBXQZBXQ ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBXQZBXQ

@synthesize data = _data;
@synthesize code = _code;


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
            self.data = [ZBXQData modelObjectWithDictionary:[dict objectForKey:kZBXQZBXQData]];
            self.code = [[self objectOrNilForKey:kZBXQZBXQCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kZBXQZBXQData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kZBXQZBXQCode];

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

    self.data = [aDecoder decodeObjectForKey:kZBXQZBXQData];
    self.code = [aDecoder decodeDoubleForKey:kZBXQZBXQCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_data forKey:kZBXQZBXQData];
    [aCoder encodeDouble:_code forKey:kZBXQZBXQCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBXQZBXQ *copy = [[ZBXQZBXQ alloc] init];
    
    if (copy) {

        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
