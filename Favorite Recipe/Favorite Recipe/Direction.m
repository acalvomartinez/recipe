//
//  Direction.m
//  Favorite Recipe
//
//  Created by Toni on 30/06/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "Direction.h"

@implementation Direction

+(instancetype) directionWithText:(NSString *)text {
    return [[self alloc] initWithText:text];
}

-(id) initWithText:(NSString *)text {
    if (self = [super init]) {
        _text = text;
    }
    
    return self;
}

-(NSString *)description {
    
    return [NSString stringWithFormat:@"%@", _text];
}

@end
