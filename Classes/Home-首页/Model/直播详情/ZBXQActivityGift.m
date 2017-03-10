//
//  ZBXQActivityGift.m
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBXQActivityGift.h"


NSString *const kZBXQActivityGiftGifUrl = @"gif_url";
NSString *const kZBXQActivityGiftId = @"id";
NSString *const kZBXQActivityGiftNum = @"num";
NSString *const kZBXQActivityGiftImg = @"img";
NSString *const kZBXQActivityGiftName = @"name";


@interface ZBXQActivityGift ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBXQActivityGift

@synthesize gifUrl = _gifUrl;
@synthesize activityGiftIdentifier = _activityGiftIdentifier;
@synthesize num = _num;
@synthesize img = _img;
@synthesize name = _name;


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
            self.gifUrl = [self objectOrNilForKey:kZBXQActivityGiftGifUrl fromDictionary:dict];
            self.activityGiftIdentifier = [[self objectOrNilForKey:kZBXQActivityGiftId fromDictionary:dict] doubleValue];
            self.num = [[self objectOrNilForKey:kZBXQActivityGiftNum fromDictionary:dict] doubleValue];
            self.img = [self objectOrNilForKey:kZBXQActivityGiftImg fromDictionary:dict];
            self.name = [self objectOrNilForKey:kZBXQActivityGiftName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.gifUrl forKey:kZBXQActivityGiftGifUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.activityGiftIdentifier] forKey:kZBXQActivityGiftId];
    [mutableDict setValue:[NSNumber numberWithDouble:self.num] forKey:kZBXQActivityGiftNum];
    [mutableDict setValue:self.img forKey:kZBXQActivityGiftImg];
    [mutableDict setValue:self.name forKey:kZBXQActivityGiftName];

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

    self.gifUrl = [aDecoder decodeObjectForKey:kZBXQActivityGiftGifUrl];
    self.activityGiftIdentifier = [aDecoder decodeDoubleForKey:kZBXQActivityGiftId];
    self.num = [aDecoder decodeDoubleForKey:kZBXQActivityGiftNum];
    self.img = [aDecoder decodeObjectForKey:kZBXQActivityGiftImg];
    self.name = [aDecoder decodeObjectForKey:kZBXQActivityGiftName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_gifUrl forKey:kZBXQActivityGiftGifUrl];
    [aCoder encodeDouble:_activityGiftIdentifier forKey:kZBXQActivityGiftId];
    [aCoder encodeDouble:_num forKey:kZBXQActivityGiftNum];
    [aCoder encodeObject:_img forKey:kZBXQActivityGiftImg];
    [aCoder encodeObject:_name forKey:kZBXQActivityGiftName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBXQActivityGift *copy = [[ZBXQActivityGift alloc] init];
    
    if (copy) {

        copy.gifUrl = [self.gifUrl copyWithZone:zone];
        copy.activityGiftIdentifier = self.activityGiftIdentifier;
        copy.num = self.num;
        copy.img = [self.img copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
