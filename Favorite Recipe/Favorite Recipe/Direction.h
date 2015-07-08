//
//  Direction.h
//  Favorite Recipe
//
//  Created by Toni on 30/06/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Direction : NSObject

@property (nonatomic, strong) NSString *text;

+ (instancetype)directionWithText:(NSString *)text;

- (instancetype)initWithText:(NSString *)text;

@end
