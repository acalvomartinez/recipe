//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Toni on 02/07/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "PlayingCardDeck.h"

#import "PlayingCard.h"

@implementation PlayingCardDeck

- (instancetype)init {
    self = [super init];
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}


@end
