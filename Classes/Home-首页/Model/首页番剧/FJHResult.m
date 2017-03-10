//
//  FJHResult.m
//
//  Created by   on 2016/11/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FJHResult.h"
#import "FJHPrevious.h"
#import "FJHAd.h"
#import "FJHSerializing.h"


NSString *const kFJHResultPrevious = @"previous";
NSString *const kFJHResultAd = @"ad";
NSString *const kFJHResultSerializing = @"serializing";


@interface FJHResult ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FJHResult

@synthesize previous = _previous;
@synthesize ad = _ad;
@synthesize serializing = _serializing;


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
            self.previous = [FJHPrevious modelObjectWithDictionary:[dict objectForKey:kFJHResultPrevious]];
            self.ad = [FJHAd modelObjectWithDictionary:[dict objectForKey:kFJHResultAd]];
    NSObject *receivedFJHSerializing = [dict objectForKey:kFJHResultSerializing];
    NSMutableArray *parsedFJHSerializing = [NSMutableArray array];
    if ([receivedFJHSerializing isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedFJHSerializing) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedFJHSerializing addObject:[FJHSerializing modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedFJHSerializing isKindOfClass:[NSDictionary class]]) {
       [parsedFJHSerializing addObject:[FJHSerializing modelObjectWithDictionary:(NSDictionary *)receivedFJHSerializing]];
    }

    self.serializing = [NSArray arrayWithArray:parsedFJHSerializing];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.previous dictionaryRepresentation] forKey:kFJHResultPrevious];
    [mutableDict setValue:[self.ad dictionaryRepresentation] forKey:kFJHResultAd];
    NSMutableArray *tempArrayForSerializing = [NSMutableArray array];
    for (NSObject *subArrayObject in self.serializing) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForSerializing addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForSerializing addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForSerializing] forKey:kFJHResultSerializing];

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

    self.previous = [aDecoder decodeObjectForKey:kFJHResultPrevious];
    self.ad = [aDecoder decodeObjectForKey:kFJHResultAd];
    self.serializing = [aDecoder decodeObjectForKey:kFJHResultSerializing];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_previous forKey:kFJHResultPrevious];
    [aCoder encodeObject:_ad forKey:kFJHResultAd];
    [aCoder encodeObject:_serializing forKey:kFJHResultSerializing];
}

- (id)copyWithZone:(NSZone *)zone
{
    FJHResult *copy = [[FJHResult alloc] init];
    
    if (copy) {

        copy.previous = [self.previous copyWithZone:zone];
        copy.ad = [self.ad copyWithZone:zone];
        copy.serializing = [self.serializing copyWithZone:zone];
    }
    
    return copy;
}


@end
