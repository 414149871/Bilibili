//
//  FJHPrevious.m
//
//  Created by   on 2016/11/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FJHPrevious.h"
#import "FJHList.h"


NSString *const kFJHPreviousSeason = @"season";
NSString *const kFJHPreviousYear = @"year";
NSString *const kFJHPreviousList = @"list";


@interface FJHPrevious ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FJHPrevious

@synthesize season = _season;
@synthesize year = _year;
@synthesize list = _list;


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
            self.season = [[self objectOrNilForKey:kFJHPreviousSeason fromDictionary:dict] doubleValue];
            self.year = [[self objectOrNilForKey:kFJHPreviousYear fromDictionary:dict] doubleValue];
    NSObject *receivedFJHList = [dict objectForKey:kFJHPreviousList];
    NSMutableArray *parsedFJHList = [NSMutableArray array];
    if ([receivedFJHList isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedFJHList) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedFJHList addObject:[FJHList modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedFJHList isKindOfClass:[NSDictionary class]]) {
       [parsedFJHList addObject:[FJHList modelObjectWithDictionary:(NSDictionary *)receivedFJHList]];
    }

    self.list = [NSArray arrayWithArray:parsedFJHList];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.season] forKey:kFJHPreviousSeason];
    [mutableDict setValue:[NSNumber numberWithDouble:self.year] forKey:kFJHPreviousYear];
    NSMutableArray *tempArrayForList = [NSMutableArray array];
    for (NSObject *subArrayObject in self.list) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForList addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForList addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForList] forKey:kFJHPreviousList];

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

    self.season = [aDecoder decodeDoubleForKey:kFJHPreviousSeason];
    self.year = [aDecoder decodeDoubleForKey:kFJHPreviousYear];
    self.list = [aDecoder decodeObjectForKey:kFJHPreviousList];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_season forKey:kFJHPreviousSeason];
    [aCoder encodeDouble:_year forKey:kFJHPreviousYear];
    [aCoder encodeObject:_list forKey:kFJHPreviousList];
}

- (id)copyWithZone:(NSZone *)zone
{
    FJHPrevious *copy = [[FJHPrevious alloc] init];
    
    if (copy) {

        copy.season = self.season;
        copy.year = self.year;
        copy.list = [self.list copyWithZone:zone];
    }
    
    return copy;
}


@end
