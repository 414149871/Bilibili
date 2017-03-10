//
//  ZBHZBHMODEL.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBHZBHMODEL.h"
#import "ZBHData.h"


NSString *const kZBHZBHMODELMessage = @"message";
NSString *const kZBHZBHMODELData = @"data";
NSString *const kZBHZBHMODELCode = @"code";


@interface ZBHZBHMODEL ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBHZBHMODEL

@synthesize message = _message;
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
            self.message = [self objectOrNilForKey:kZBHZBHMODELMessage fromDictionary:dict];
            self.data = [ZBHData modelObjectWithDictionary:[dict objectForKey:kZBHZBHMODELData]];
            self.code = [[self objectOrNilForKey:kZBHZBHMODELCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kZBHZBHMODELMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kZBHZBHMODELData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kZBHZBHMODELCode];

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

    self.message = [aDecoder decodeObjectForKey:kZBHZBHMODELMessage];
    self.data = [aDecoder decodeObjectForKey:kZBHZBHMODELData];
    self.code = [aDecoder decodeDoubleForKey:kZBHZBHMODELCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kZBHZBHMODELMessage];
    [aCoder encodeObject:_data forKey:kZBHZBHMODELData];
    [aCoder encodeDouble:_code forKey:kZBHZBHMODELCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBHZBHMODEL *copy = [[ZBHZBHMODEL alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
