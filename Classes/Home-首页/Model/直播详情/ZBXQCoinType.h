//
//  ZBXQCoinType.h
//
//  Created by   on 2016/11/15
//  Copyright (c) 2016 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZBXQCoinType : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *gold;
@property (nonatomic, strong) NSString *silver;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
