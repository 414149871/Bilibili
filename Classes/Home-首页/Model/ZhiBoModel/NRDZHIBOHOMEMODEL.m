//
//  NRDZHIBOHOMEMODEL.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NRDZHIBOHOMEMODEL.h"
#import "NRDData.h"

NSString *const kNRDZHIBOHOMEMODELMessage = @"message";
NSString *const kNRDZHIBOHOMEMODELData = @"data";
NSString *const kNRDZHIBOHOMEMODELCode = @"code";


@interface NRDZHIBOHOMEMODEL ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NRDZHIBOHOMEMODEL

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
            self.message = [self objectOrNilForKey:kNRDZHIBOHOMEMODELMessage fromDictionary:dict];
            self.data = [NRDData modelObjectWithDictionary:[dict objectForKey:kNRDZHIBOHOMEMODELData]];
            self.code = [[self objectOrNilForKey:kNRDZHIBOHOMEMODELCode fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kNRDZHIBOHOMEMODELMessage];
    [mutableDict setValue:[self.data dictionaryRepresentation] forKey:kNRDZHIBOHOMEMODELData];
    [mutableDict setValue:[NSNumber numberWithDouble:self.code] forKey:kNRDZHIBOHOMEMODELCode];

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

    self.message = [aDecoder decodeObjectForKey:kNRDZHIBOHOMEMODELMessage];
    self.data = [aDecoder decodeObjectForKey:kNRDZHIBOHOMEMODELData];
    self.code = [aDecoder decodeDoubleForKey:kNRDZHIBOHOMEMODELCode];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kNRDZHIBOHOMEMODELMessage];
    [aCoder encodeObject:_data forKey:kNRDZHIBOHOMEMODELData];
    [aCoder encodeDouble:_code forKey:kNRDZHIBOHOMEMODELCode];
}

- (id)copyWithZone:(NSZone *)zone
{
    NRDZHIBOHOMEMODEL *copy = [[NRDZHIBOHOMEMODEL alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.data = [self.data copyWithZone:zone];
        copy.code = self.code;
    }
    
    return copy;
}


@end
