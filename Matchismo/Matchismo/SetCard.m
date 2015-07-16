//
//  SetCard.m
//  Matchismo
//
//  Created by Toni on 9/7/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

+ (NSUInteger)maxValue {
    return 3;
}

- (int)match:(NSArray *)otherCards {
    
    NSMutableArray *colors = [[NSMutableArray alloc] initWithObjects:@(self.color), nil];
    NSMutableArray *shapes = [[NSMutableArray alloc] initWithObjects:@(self.shape), nil];
    NSMutableArray *shades = [[NSMutableArray alloc] initWithObjects:@(self.shade), nil];
    NSMutableArray *values = [[NSMutableArray alloc] initWithObjects:@(self.value), nil];
    
    for (SetCard *otherCard in otherCards) {
        [colors addObject:@(otherCard.color)];
        [shapes addObject:@(otherCard.shape)];
        [shades addObject:@(otherCard.shade)];
        [values addObject:@(otherCard.value)];
    }
    
    NSSet *colorsUniques = [[NSSet alloc] initWithArray:colors];
    NSSet *shapesUniques = [[NSSet alloc] initWithArray:shapes];
    NSSet *shadesUniques = [[NSSet alloc] initWithArray:shades];
    NSSet *valuesUniques = [[NSSet alloc] initWithArray:values];
    
    return ([colorsUniques count] == 2 ||
            [shapesUniques count] == 2 ||
            [shadesUniques count] == 2 ||
            [valuesUniques count] == 2) ? 0 : 1;
}


- (NSString *)contents {
    return @"";
}

@end
