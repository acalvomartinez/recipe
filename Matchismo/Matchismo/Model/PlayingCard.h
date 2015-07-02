//
//  PlayingCard.h
//  Matchismo
//
//  Created by Toni on 02/07/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
