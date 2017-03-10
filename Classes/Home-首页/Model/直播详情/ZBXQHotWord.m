//
//  ZBXQHotWord.m
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBXQHotWord.h"


NSString *const kZBXQHotWordId = @"id";
NSString *const kZBXQHotWordWords = @"words";


@interface ZBXQHotWord ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBXQHotWord

@synthesize hotWordIdentifier = _hotWordIdentifier;
@synthesize words = _words;


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
            self.hotWordIdentifier = [[self objectOrNilForKey:kZBXQHotWordId fromDictionary:dict] doubleValue];
            self.words = [self objectOrNilForKey:kZBXQHotWordWords fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.hotWordIdentifier] forKey:kZBXQHotWordId];
    [mutableDict setValue:self.words forKey:kZBXQHotWordWords];

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

    self.hotWordIdentifier = [aDecoder decodeDoubleForKey:kZBXQHotWordId];
    self.words = [aDecoder decodeObjectForKey:kZBXQHotWordWords];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_hotWordIdentifier forKey:kZBXQHotWordId];
    [aCoder encodeObject:_words forKey:kZBXQHotWordWords];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBXQHotWord *copy = [[ZBXQHotWord alloc] init];
    
    if (copy) {

        copy.hotWordIdentifier = self.hotWordIdentifier;
        copy.words = [self.words copyWithZone:zone];
    }
    
    return copy;
}


@end
