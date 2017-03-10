//
//  Data.h
//
//  Created by   on 2016/10/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Banner, Ext;

@interface Data : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) Banner *banner;
@property (nonatomic, strong) NSString *style;
@property (nonatomic, strong) Ext *ext;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *param;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSArray *body;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
