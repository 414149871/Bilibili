//
//  Banner.m
//
//  Created by   on 2016/10/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "Banner.h"
#import "Top.h"
#import "Bottom.h"


NSString *const kBannerTop = @"top";
NSString *const kBannerBottom = @"bottom";


@interface Banner ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation Banner

@synthesize top = _top;
@synthesize bottom = _bottom;


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
    NSObject *receivedTop = [dict objectForKey:kBannerTop];
    NSMutableArray *parsedTop = [NSMutableArray array];
    if ([receivedTop isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedTop) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedTop addObject:[Top modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedTop isKindOfClass:[NSDictionary class]]) {
       [parsedTop addObject:[Top modelObjectWithDictionary:(NSDictionary *)receivedTop]];
    }

    self.top = [NSArray arrayWithArray:parsedTop];
    NSObject *receivedBottom = [dict objectForKey:kBannerBottom];
    NSMutableArray *parsedBottom = [NSMutableArray array];
    if ([receivedBottom isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedBottom) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedBottom addObject:[Bottom modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedBottom isKindOfClass:[NSDictionary class]]) {
       [parsedBottom addObject:[Bottom modelObjectWithDictionary:(NSDictionary *)receivedBottom]];
    }

    self.bottom = [NSArray arrayWithArray:parsedBottom];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForTop = [NSMutableArray array];
    for (NSObject *subArrayObject in self.top) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTop addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTop addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTop] forKey:kBannerTop];
    NSMutableArray *tempArrayForBottom = [NSMutableArray array];
    for (NSObject *subArrayObject in self.bottom) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBottom addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBottom addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBottom] forKey:kBannerBottom];

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

    self.top = [aDecoder decodeObjectForKey:kBannerTop];
    self.bottom = [aDecoder decodeObjectForKey:kBannerBottom];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_top forKey:kBannerTop];
    [aCoder encodeObject:_bottom forKey:kBannerBottom];
}

- (id)copyWithZone:(NSZone *)zone
{
    Banner *copy = [[Banner alloc] init];
    
    if (copy) {

        copy.top = [self.top copyWithZone:zone];
        copy.bottom = [self.bottom copyWithZone:zone];
    }
    
    return copy;
}


@end
