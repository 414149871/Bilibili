//
//  FJHBody.m
//
//  Created by   on 2016/11/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FJHBody.h"


NSString *const kFJHBodyLink = @"link";
NSString *const kFJHBodyImg = @"img";
NSString *const kFJHBodyTitle = @"title";
NSString *const kFJHBodyIndex = @"index";


@interface FJHBody ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FJHBody

@synthesize link = _link;
@synthesize img = _img;
@synthesize title = _title;
@synthesize index = _index;


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
            self.link = [self objectOrNilForKey:kFJHBodyLink fromDictionary:dict];
            self.img = [self objectOrNilForKey:kFJHBodyImg fromDictionary:dict];
            self.title = [self objectOrNilForKey:kFJHBodyTitle fromDictionary:dict];
            self.index = [[self objectOrNilForKey:kFJHBodyIndex fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.link forKey:kFJHBodyLink];
    [mutableDict setValue:self.img forKey:kFJHBodyImg];
    [mutableDict setValue:self.title forKey:kFJHBodyTitle];
    [mutableDict setValue:[NSNumber numberWithDouble:self.index] forKey:kFJHBodyIndex];

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

    self.link = [aDecoder decodeObjectForKey:kFJHBodyLink];
    self.img = [aDecoder decodeObjectForKey:kFJHBodyImg];
    self.title = [aDecoder decodeObjectForKey:kFJHBodyTitle];
    self.index = [aDecoder decodeDoubleForKey:kFJHBodyIndex];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_link forKey:kFJHBodyLink];
    [aCoder encodeObject:_img forKey:kFJHBodyImg];
    [aCoder encodeObject:_title forKey:kFJHBodyTitle];
    [aCoder encodeDouble:_index forKey:kFJHBodyIndex];
}

- (id)copyWithZone:(NSZone *)zone
{
    FJHBody *copy = [[FJHBody alloc] init];
    
    if (copy) {

        copy.link = [self.link copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.index = self.index;
    }
    
    return copy;
}


@end
