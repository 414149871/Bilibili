//
//  NRDOwner.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NRDOwner.h"


NSString *const kNRDOwnerFace = @"face";
NSString *const kNRDOwnerMid = @"mid";
NSString *const kNRDOwnerName = @"name";


@interface NRDOwner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NRDOwner

@synthesize face = _face;
@synthesize mid = _mid;
@synthesize name = _name;


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
            self.face = [self objectOrNilForKey:kNRDOwnerFace fromDictionary:dict];
            self.mid = [[self objectOrNilForKey:kNRDOwnerMid fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kNRDOwnerName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.face forKey:kNRDOwnerFace];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mid] forKey:kNRDOwnerMid];
    [mutableDict setValue:self.name forKey:kNRDOwnerName];

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

    self.face = [aDecoder decodeObjectForKey:kNRDOwnerFace];
    self.mid = [aDecoder decodeDoubleForKey:kNRDOwnerMid];
    self.name = [aDecoder decodeObjectForKey:kNRDOwnerName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_face forKey:kNRDOwnerFace];
    [aCoder encodeDouble:_mid forKey:kNRDOwnerMid];
    [aCoder encodeObject:_name forKey:kNRDOwnerName];
}

- (id)copyWithZone:(NSZone *)zone
{
    NRDOwner *copy = [[NRDOwner alloc] init];
    
    if (copy) {

        copy.face = [self.face copyWithZone:zone];
        copy.mid = self.mid;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
