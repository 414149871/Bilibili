//
//  ZBHOwner.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBHOwner.h"


NSString *const kZBHOwnerFace = @"face";
NSString *const kZBHOwnerMid = @"mid";
NSString *const kZBHOwnerName = @"name";


@interface ZBHOwner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBHOwner

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
            self.face = [self objectOrNilForKey:kZBHOwnerFace fromDictionary:dict];
            self.mid = [[self objectOrNilForKey:kZBHOwnerMid fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kZBHOwnerName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.face forKey:kZBHOwnerFace];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mid] forKey:kZBHOwnerMid];
    [mutableDict setValue:self.name forKey:kZBHOwnerName];

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

    self.face = [aDecoder decodeObjectForKey:kZBHOwnerFace];
    self.mid = [aDecoder decodeDoubleForKey:kZBHOwnerMid];
    self.name = [aDecoder decodeObjectForKey:kZBHOwnerName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_face forKey:kZBHOwnerFace];
    [aCoder encodeDouble:_mid forKey:kZBHOwnerMid];
    [aCoder encodeObject:_name forKey:kZBHOwnerName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBHOwner *copy = [[ZBHOwner alloc] init];
    
    if (copy) {

        copy.face = [self.face copyWithZone:zone];
        copy.mid = self.mid;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
