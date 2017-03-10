//
//  FJHAd.m
//
//  Created by   on 2016/11/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FJHAd.h"
#import "FJHHead.h"
#import "FJHBody.h"


NSString *const kFJHAdHead = @"head";
NSString *const kFJHAdBody = @"body";


@interface FJHAd ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FJHAd

@synthesize head = _head;
@synthesize body = _body;


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
    NSObject *receivedFJHHead = [dict objectForKey:kFJHAdHead];
    NSMutableArray *parsedFJHHead = [NSMutableArray array];
    if ([receivedFJHHead isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedFJHHead) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedFJHHead addObject:[FJHHead modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedFJHHead isKindOfClass:[NSDictionary class]]) {
       [parsedFJHHead addObject:[FJHHead modelObjectWithDictionary:(NSDictionary *)receivedFJHHead]];
    }

    self.head = [NSArray arrayWithArray:parsedFJHHead];
    NSObject *receivedFJHBody = [dict objectForKey:kFJHAdBody];
    NSMutableArray *parsedFJHBody = [NSMutableArray array];
    if ([receivedFJHBody isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedFJHBody) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedFJHBody addObject:[FJHBody modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedFJHBody isKindOfClass:[NSDictionary class]]) {
       [parsedFJHBody addObject:[FJHBody modelObjectWithDictionary:(NSDictionary *)receivedFJHBody]];
    }

    self.body = [NSArray arrayWithArray:parsedFJHBody];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForHead = [NSMutableArray array];
    for (NSObject *subArrayObject in self.head) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForHead addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForHead addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForHead] forKey:kFJHAdHead];
    NSMutableArray *tempArrayForBody = [NSMutableArray array];
    for (NSObject *subArrayObject in self.body) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForBody addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForBody addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForBody] forKey:kFJHAdBody];

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

    self.head = [aDecoder decodeObjectForKey:kFJHAdHead];
    self.body = [aDecoder decodeObjectForKey:kFJHAdBody];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_head forKey:kFJHAdHead];
    [aCoder encodeObject:_body forKey:kFJHAdBody];
}

- (id)copyWithZone:(NSZone *)zone
{
    FJHAd *copy = [[FJHAd alloc] init];
    
    if (copy) {

        copy.head = [self.head copyWithZone:zone];
        copy.body = [self.body copyWithZone:zone];
    }
    
    return copy;
}


@end
