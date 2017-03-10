//
//  NRDCover.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "NRDCover.h"


NSString *const kNRDCoverSrc = @"src";
NSString *const kNRDCoverWidth = @"width";
NSString *const kNRDCoverHeight = @"height";


@interface NRDCover ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation NRDCover

@synthesize src = _src;
@synthesize width = _width;
@synthesize height = _height;


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
            self.src = [self objectOrNilForKey:kNRDCoverSrc fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kNRDCoverWidth fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kNRDCoverHeight fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.src forKey:kNRDCoverSrc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kNRDCoverWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kNRDCoverHeight];

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

    self.src = [aDecoder decodeObjectForKey:kNRDCoverSrc];
    self.width = [aDecoder decodeDoubleForKey:kNRDCoverWidth];
    self.height = [aDecoder decodeDoubleForKey:kNRDCoverHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_src forKey:kNRDCoverSrc];
    [aCoder encodeDouble:_width forKey:kNRDCoverWidth];
    [aCoder encodeDouble:_height forKey:kNRDCoverHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    NRDCover *copy = [[NRDCover alloc] init];
    
    if (copy) {

        copy.src = [self.src copyWithZone:zone];
        copy.width = self.width;
        copy.height = self.height;
    }
    
    return copy;
}


@end
