//
//  FJHHead.m
//
//  Created by   on 2016/11/11
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "FJHHead.h"


NSString *const kFJHHeadId = @"id";
NSString *const kFJHHeadImg = @"img";
NSString *const kFJHHeadIsAd = @"is_ad";
NSString *const kFJHHeadPubTime = @"pub_time";
NSString *const kFJHHeadTitle = @"title";
NSString *const kFJHHeadLink = @"link";


@interface FJHHead ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation FJHHead

@synthesize headIdentifier = _headIdentifier;
@synthesize img = _img;
@synthesize isAd = _isAd;
@synthesize pubTime = _pubTime;
@synthesize title = _title;
@synthesize link = _link;


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
            self.headIdentifier = [[self objectOrNilForKey:kFJHHeadId fromDictionary:dict] doubleValue];
            self.img = [self objectOrNilForKey:kFJHHeadImg fromDictionary:dict];
            self.isAd = [[self objectOrNilForKey:kFJHHeadIsAd fromDictionary:dict] doubleValue];
            self.pubTime = [self objectOrNilForKey:kFJHHeadPubTime fromDictionary:dict];
            self.title = [self objectOrNilForKey:kFJHHeadTitle fromDictionary:dict];
            self.link = [self objectOrNilForKey:kFJHHeadLink fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.headIdentifier] forKey:kFJHHeadId];
    [mutableDict setValue:self.img forKey:kFJHHeadImg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isAd] forKey:kFJHHeadIsAd];
    [mutableDict setValue:self.pubTime forKey:kFJHHeadPubTime];
    [mutableDict setValue:self.title forKey:kFJHHeadTitle];
    [mutableDict setValue:self.link forKey:kFJHHeadLink];

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

    self.headIdentifier = [aDecoder decodeDoubleForKey:kFJHHeadId];
    self.img = [aDecoder decodeObjectForKey:kFJHHeadImg];
    self.isAd = [aDecoder decodeDoubleForKey:kFJHHeadIsAd];
    self.pubTime = [aDecoder decodeObjectForKey:kFJHHeadPubTime];
    self.title = [aDecoder decodeObjectForKey:kFJHHeadTitle];
    self.link = [aDecoder decodeObjectForKey:kFJHHeadLink];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_headIdentifier forKey:kFJHHeadId];
    [aCoder encodeObject:_img forKey:kFJHHeadImg];
    [aCoder encodeDouble:_isAd forKey:kFJHHeadIsAd];
    [aCoder encodeObject:_pubTime forKey:kFJHHeadPubTime];
    [aCoder encodeObject:_title forKey:kFJHHeadTitle];
    [aCoder encodeObject:_link forKey:kFJHHeadLink];
}

- (id)copyWithZone:(NSZone *)zone
{
    FJHHead *copy = [[FJHHead alloc] init];
    
    if (copy) {

        copy.headIdentifier = self.headIdentifier;
        copy.img = [self.img copyWithZone:zone];
        copy.isAd = self.isAd;
        copy.pubTime = [self.pubTime copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.link = [self.link copyWithZone:zone];
    }
    
    return copy;
}


@end
