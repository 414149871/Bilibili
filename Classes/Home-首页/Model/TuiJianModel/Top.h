//
//  Top.h
//
//  Created by   on 2016/10/25
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Top : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double topIdentifier;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *hash;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *uri;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
