//
//  ZBXQRoomgifts.m
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBXQRoomgifts.h"
#import "ZBXQCoinType.h"


NSString *const kZBXQRoomgiftsCountSet = @"count_set";
NSString *const kZBXQRoomgiftsImg = @"img";
NSString *const kZBXQRoomgiftsId = @"id";
NSString *const kZBXQRoomgiftsGifUrl = @"gif_url";
NSString *const kZBXQRoomgiftsPrice = @"price";
NSString *const kZBXQRoomgiftsName = @"name";
NSString *const kZBXQRoomgiftsCoinType = @"coin_type";


@interface ZBXQRoomgifts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBXQRoomgifts

@synthesize countSet = _countSet;
@synthesize img = _img;
@synthesize roomgiftsIdentifier = _roomgiftsIdentifier;
@synthesize gifUrl = _gifUrl;
@synthesize price = _price;
@synthesize name = _name;
@synthesize coinType = _coinType;


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
            self.countSet = [self objectOrNilForKey:kZBXQRoomgiftsCountSet fromDictionary:dict];
            self.img = [self objectOrNilForKey:kZBXQRoomgiftsImg fromDictionary:dict];
            self.roomgiftsIdentifier = [[self objectOrNilForKey:kZBXQRoomgiftsId fromDictionary:dict] doubleValue];
            self.gifUrl = [self objectOrNilForKey:kZBXQRoomgiftsGifUrl fromDictionary:dict];
            self.price = [[self objectOrNilForKey:kZBXQRoomgiftsPrice fromDictionary:dict] doubleValue];
            self.name = [self objectOrNilForKey:kZBXQRoomgiftsName fromDictionary:dict];
            self.coinType = [ZBXQCoinType modelObjectWithDictionary:[dict objectForKey:kZBXQRoomgiftsCoinType]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.countSet forKey:kZBXQRoomgiftsCountSet];
    [mutableDict setValue:self.img forKey:kZBXQRoomgiftsImg];
    [mutableDict setValue:[NSNumber numberWithDouble:self.roomgiftsIdentifier] forKey:kZBXQRoomgiftsId];
    [mutableDict setValue:self.gifUrl forKey:kZBXQRoomgiftsGifUrl];
    [mutableDict setValue:[NSNumber numberWithDouble:self.price] forKey:kZBXQRoomgiftsPrice];
    [mutableDict setValue:self.name forKey:kZBXQRoomgiftsName];
    [mutableDict setValue:[self.coinType dictionaryRepresentation] forKey:kZBXQRoomgiftsCoinType];

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

    self.countSet = [aDecoder decodeObjectForKey:kZBXQRoomgiftsCountSet];
    self.img = [aDecoder decodeObjectForKey:kZBXQRoomgiftsImg];
    self.roomgiftsIdentifier = [aDecoder decodeDoubleForKey:kZBXQRoomgiftsId];
    self.gifUrl = [aDecoder decodeObjectForKey:kZBXQRoomgiftsGifUrl];
    self.price = [aDecoder decodeDoubleForKey:kZBXQRoomgiftsPrice];
    self.name = [aDecoder decodeObjectForKey:kZBXQRoomgiftsName];
    self.coinType = [aDecoder decodeObjectForKey:kZBXQRoomgiftsCoinType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_countSet forKey:kZBXQRoomgiftsCountSet];
    [aCoder encodeObject:_img forKey:kZBXQRoomgiftsImg];
    [aCoder encodeDouble:_roomgiftsIdentifier forKey:kZBXQRoomgiftsId];
    [aCoder encodeObject:_gifUrl forKey:kZBXQRoomgiftsGifUrl];
    [aCoder encodeDouble:_price forKey:kZBXQRoomgiftsPrice];
    [aCoder encodeObject:_name forKey:kZBXQRoomgiftsName];
    [aCoder encodeObject:_coinType forKey:kZBXQRoomgiftsCoinType];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBXQRoomgifts *copy = [[ZBXQRoomgifts alloc] init];
    
    if (copy) {

        copy.countSet = [self.countSet copyWithZone:zone];
        copy.img = [self.img copyWithZone:zone];
        copy.roomgiftsIdentifier = self.roomgiftsIdentifier;
        copy.gifUrl = [self.gifUrl copyWithZone:zone];
        copy.price = self.price;
        copy.name = [self.name copyWithZone:zone];
        copy.coinType = [self.coinType copyWithZone:zone];
    }
    
    return copy;
}


@end
