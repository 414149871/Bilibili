//
//  Top.m
//
//  Created by   on 2016/10/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Top.h"


NSString *const kTopId = @"id";
NSString *const kTopTitle = @"title";
NSString *const kTopHash = @"hash";
NSString *const kTopImage = @"image";
NSString *const kTopUri = @"uri";


@interface Top ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Top

@synthesize topIdentifier = _topIdentifier;
@synthesize title = _title;
@synthesize hash = _hash;
@synthesize image = _image;
@synthesize uri = _uri;


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
            self.topIdentifier = [[self objectOrNilForKey:kTopId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kTopTitle fromDictionary:dict];
            self.hash = [self objectOrNilForKey:kTopHash fromDictionary:dict];
            self.image = [self objectOrNilForKey:kTopImage fromDictionary:dict];
            self.uri = [self objectOrNilForKey:kTopUri fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.topIdentifier] forKey:kTopId];
    [mutableDict setValue:self.title forKey:kTopTitle];
    [mutableDict setValue:self.hash forKey:kTopHash];
    [mutableDict setValue:self.image forKey:kTopImage];
    [mutableDict setValue:self.uri forKey:kTopUri];

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

    self.topIdentifier = [aDecoder decodeDoubleForKey:kTopId];
    self.title = [aDecoder decodeObjectForKey:kTopTitle];
    self.hash = [aDecoder decodeObjectForKey:kTopHash];
    self.image = [aDecoder decodeObjectForKey:kTopImage];
    self.uri = [aDecoder decodeObjectForKey:kTopUri];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_topIdentifier forKey:kTopId];
    [aCoder encodeObject:_title forKey:kTopTitle];
    [aCoder encodeObject:_hash forKey:kTopHash];
    [aCoder encodeObject:_image forKey:kTopImage];
    [aCoder encodeObject:_uri forKey:kTopUri];
}

- (id)copyWithZone:(NSZone *)zone
{
    Top *copy = [[Top alloc] init];
    
    if (copy) {

        copy.topIdentifier = self.topIdentifier;
        copy.title = [self.title copyWithZone:zone];
        copy.hash = [self.hash copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.uri = [self.uri copyWithZone:zone];
    }
    
    return copy;
}


@end
