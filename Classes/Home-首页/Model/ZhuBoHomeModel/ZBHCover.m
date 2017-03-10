//
//  ZBHCover.m
//
//  Created by   on 2016/11/9
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBHCover.h"


NSString *const kZBHCoverSrc = @"src";
NSString *const kZBHCoverWidth = @"width";
NSString *const kZBHCoverHeight = @"height";


@interface ZBHCover ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBHCover

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
            self.src = [self objectOrNilForKey:kZBHCoverSrc fromDictionary:dict];
            self.width = [[self objectOrNilForKey:kZBHCoverWidth fromDictionary:dict] doubleValue];
            self.height = [[self objectOrNilForKey:kZBHCoverHeight fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.src forKey:kZBHCoverSrc];
    [mutableDict setValue:[NSNumber numberWithDouble:self.width] forKey:kZBHCoverWidth];
    [mutableDict setValue:[NSNumber numberWithDouble:self.height] forKey:kZBHCoverHeight];

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

    self.src = [aDecoder decodeObjectForKey:kZBHCoverSrc];
    self.width = [aDecoder decodeDoubleForKey:kZBHCoverWidth];
    self.height = [aDecoder decodeDoubleForKey:kZBHCoverHeight];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_src forKey:kZBHCoverSrc];
    [aCoder encodeDouble:_width forKey:kZBHCoverWidth];
    [aCoder encodeDouble:_height forKey:kZBHCoverHeight];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBHCover *copy = [[ZBHCover alloc] init];
    
    if (copy) {

        copy.src = [self.src copyWithZone:zone];
        copy.width = self.width;
        copy.height = self.height;
    }
    
    return copy;
}


@end
