//
//  NamedEntity.h
//  Favorite Recipe
//
//  Created by Toni on 21/07/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NamedEntity : NSObject <NSCoding>

@property (nonatomic, strong) NSString *name;

+ (instancetype)entityWithName:(NSString *)name;

- (instancetype)initWithName:(NSString *)name;

@end
