//
//  ZBXQOwner.m
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBXQOwner.h"


NSString *const kZBXQOwnerFace = @"face";
NSString *const kZBXQOwnerMid = @"mid";
NSString *const kZBXQOwnerName = @"name";


@interface ZBXQOwner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBXQOwner

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
            self.face = [self objectOrNilForKey:kZBXQOwnerFace fromDictionary:dict];
            self.mid = [[self objectOrNilForKey:kZBXQOwnerMid fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kZBXQOwnerName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.face forKey:kZBXQOwnerFace];
    [mutableDict setValue:[NSNumber numberWithDouble:self.mid] forKey:kZBXQOwnerMid];
    [mutableDict setValue:self.name forKey:kZBXQOwnerName];

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

    self.face = [aDecoder decodeObjectForKey:kZBXQOwnerFace];
    self.mid = [aDecoder decodeDoubleForKey:kZBXQOwnerMid];
    self.name = [aDecoder decodeObjectForKey:kZBXQOwnerName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_face forKey:kZBXQOwnerFace];
    [aCoder encodeDouble:_mid forKey:kZBXQOwnerMid];
    [aCoder encodeObject:_name forKey:kZBXQOwnerName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBXQOwner *copy = [[ZBXQOwner alloc] init];
    
    if (copy) {

        copy.face = [self.face copyWithZone:zone];
        copy.mid = self.mid;
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
