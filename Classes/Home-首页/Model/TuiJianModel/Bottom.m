//
//  Bottom.m
//
//  Created by   on 2016/10/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Bottom.h"


NSString *const kBottomId = @"id";
NSString *const kBottomTitle = @"title";
NSString *const kBottomHash = @"hash";
NSString *const kBottomImage = @"image";
NSString *const kBottomUri = @"uri";


@interface Bottom ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Bottom

@synthesize bottomIdentifier = _bottomIdentifier;
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
            self.bottomIdentifier = [[self objectOrNilForKey:kBottomId fromDictionary:dict] doubleValue];
            self.title = [self objectOrNilForKey:kBottomTitle fromDictionary:dict];
            self.hash = [self objectOrNilForKey:kBottomHash fromDictionary:dict];
            self.image = [self objectOrNilForKey:kBottomImage fromDictionary:dict];
            self.uri = [self objectOrNilForKey:kBottomUri fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.bottomIdentifier] forKey:kBottomId];
    [mutableDict setValue:self.title forKey:kBottomTitle];
    [mutableDict setValue:self.hash forKey:kBottomHash];
    [mutableDict setValue:self.image forKey:kBottomImage];
    [mutableDict setValue:self.uri forKey:kBottomUri];

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

    self.bottomIdentifier = [aDecoder decodeDoubleForKey:kBottomId];
    self.title = [aDecoder decodeObjectForKey:kBottomTitle];
    self.hash = [aDecoder decodeObjectForKey:kBottomHash];
    self.image = [aDecoder decodeObjectForKey:kBottomImage];
    self.uri = [aDecoder decodeObjectForKey:kBottomUri];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_bottomIdentifier forKey:kBottomId];
    [aCoder encodeObject:_title forKey:kBottomTitle];
    [aCoder encodeObject:_hash forKey:kBottomHash];
    [aCoder encodeObject:_image forKey:kBottomImage];
    [aCoder encodeObject:_uri forKey:kBottomUri];
}

- (id)copyWithZone:(NSZone *)zone
{
    Bottom *copy = [[Bottom alloc] init];
    
    if (copy) {

        copy.bottomIdentifier = self.bottomIdentifier;
        copy.title = [self.title copyWithZone:zone];
        copy.hash = [self.hash copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.uri = [self.uri copyWithZone:zone];
    }
    
    return copy;
}


@end
