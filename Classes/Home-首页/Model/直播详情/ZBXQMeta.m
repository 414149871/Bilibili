//
//  ZBXQMeta.m
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import "ZBXQMeta.h"
#import "ZBXQTagIds.h"


NSString *const kZBXQMetaTypeid = @"typeid";
NSString *const kZBXQMetaTagIds = @"tag_ids";
NSString *const kZBXQMetaCheckStatus = @"check_status";
NSString *const kZBXQMetaAid = @"aid";
NSString *const kZBXQMetaTag = @"tag";
NSString *const kZBXQMetaDescription = @"description";
NSString *const kZBXQMetaCover = @"cover";


@interface ZBXQMeta ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZBXQMeta

@synthesize typeid = _typeid;
@synthesize tagIds = _tagIds;
@synthesize checkStatus = _checkStatus;
@synthesize aid = _aid;
@synthesize tag = _tag;
@synthesize metaDescription = _metaDescription;
@synthesize cover = _cover;


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
            self.typeid = [[self objectOrNilForKey:kZBXQMetaTypeid fromDictionary:dict] doubleValue];
            self.tagIds = [ZBXQTagIds modelObjectWithDictionary:[dict objectForKey:kZBXQMetaTagIds]];
            self.checkStatus = [self objectOrNilForKey:kZBXQMetaCheckStatus fromDictionary:dict];
            self.aid = [[self objectOrNilForKey:kZBXQMetaAid fromDictionary:dict] doubleValue];
            self.tag = [self objectOrNilForKey:kZBXQMetaTag fromDictionary:dict];
            self.metaDescription = [self objectOrNilForKey:kZBXQMetaDescription fromDictionary:dict];
            self.cover = [self objectOrNilForKey:kZBXQMetaCover fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.typeid] forKey:kZBXQMetaTypeid];
    [mutableDict setValue:[self.tagIds dictionaryRepresentation] forKey:kZBXQMetaTagIds];
    [mutableDict setValue:self.checkStatus forKey:kZBXQMetaCheckStatus];
    [mutableDict setValue:[NSNumber numberWithDouble:self.aid] forKey:kZBXQMetaAid];
    NSMutableArray *tempArrayForTag = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tag) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTag addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTag addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTag] forKey:kZBXQMetaTag];
    [mutableDict setValue:self.metaDescription forKey:kZBXQMetaDescription];
    [mutableDict setValue:self.cover forKey:kZBXQMetaCover];

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

    self.typeid = [aDecoder decodeDoubleForKey:kZBXQMetaTypeid];
    self.tagIds = [aDecoder decodeObjectForKey:kZBXQMetaTagIds];
    self.checkStatus = [aDecoder decodeObjectForKey:kZBXQMetaCheckStatus];
    self.aid = [aDecoder decodeDoubleForKey:kZBXQMetaAid];
    self.tag = [aDecoder decodeObjectForKey:kZBXQMetaTag];
    self.metaDescription = [aDecoder decodeObjectForKey:kZBXQMetaDescription];
    self.cover = [aDecoder decodeObjectForKey:kZBXQMetaCover];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_typeid forKey:kZBXQMetaTypeid];
    [aCoder encodeObject:_tagIds forKey:kZBXQMetaTagIds];
    [aCoder encodeObject:_checkStatus forKey:kZBXQMetaCheckStatus];
    [aCoder encodeDouble:_aid forKey:kZBXQMetaAid];
    [aCoder encodeObject:_tag forKey:kZBXQMetaTag];
    [aCoder encodeObject:_metaDescription forKey:kZBXQMetaDescription];
    [aCoder encodeObject:_cover forKey:kZBXQMetaCover];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZBXQMeta *copy = [[ZBXQMeta alloc] init];
    
    if (copy) {

        copy.typeid = self.typeid;
        copy.tagIds = [self.tagIds copyWithZone:zone];
        copy.checkStatus = [self.checkStatus copyWithZone:zone];
        copy.aid = self.aid;
        copy.tag = [self.tag copyWithZone:zone];
        copy.metaDescription = [self.metaDescription copyWithZone:zone];
        copy.cover = [self.cover copyWithZone:zone];
    }
    
    return copy;
}


@end
