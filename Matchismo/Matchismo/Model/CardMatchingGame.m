//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Toni on 4/7/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "CardMatchingGame.h"

#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame ()

@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong, readwrite) NSString *message;
@property (nonatomic, strong) NSMutableArray *cards;
@property (nonatomic, strong) NSMutableArray *cardsToMatch;

@property (nonatomic) NSUInteger cardsSelected;
@property (nonatomic) NSUInteger cardsToSelect;

@end

@implementation CardMatchingGame


- (NSMutableArray *)cards {
    
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

static const int DEFAULT_CARDS_TO_SELECT = 2;

- (instancetype)initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck {
    
    return [self initWithCardCount:count
                     cardsToSelect:DEFAULT_CARDS_TO_SELECT
                         usingDeck:deck ];
}

- (instancetype)initWithCardCount:(NSUInteger)count
                    cardsToSelect:(NSInteger) cardsToSelect
                        usingDeck:(Deck *)deck {
    
    self = [super init];
    
    if (self) {
        _cardsToSelect = cardsToSelect;
        _cardsToMatch = [NSMutableArray new];
        
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
    }
    
    return self;

}

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void)chooseCardAtIndex:(NSUInteger)index {
 
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            if (self.cardsSelected == self.cardsToSelect-1) {
                for (Card *otherCard in self.cards) {
                    if (otherCard.isChosen && !otherCard.isMatched) {
                        [self.cardsToMatch addObject:otherCard];
                    }
                }
                
                self.message = [card contents];
                
                int matchScore = [card match:self.cardsToMatch];
                if (matchScore) {
                    self.score += matchScore * MATCH_BONUS;
                    for (Card *matchedCard in self.cardsToMatch) {
                        matchedCard.matched = YES;
                        
                        self.message = [self.message stringByAppendingString:[NSString stringWithFormat:@", %@", matchedCard.contents]];
                    }
                    card.matched = YES;
                    
                    self.message = [self.message stringByAppendingString:[NSString stringWithFormat:@" match! %d points!", matchScore * MATCH_BONUS]];
                    
                } else {
                    self.score -= MISMATCH_PENALTY;
                    
                    for (Card *matchedCard in self.cardsToMatch) {
                        matchedCard.chosen = NO;
                        
                        self.message = [self.message stringByAppendingString:[NSString stringWithFormat:@", %@", matchedCard.contents]];
                        
                    }
                    
                    self.message = [self.message stringByAppendingString:[NSString stringWithFormat:@" don't match! %d point penalty!", MISMATCH_PENALTY]];
                }
                
                [self.cardsToMatch removeAllObjects];
                self.cardsSelected = 0;
                
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
            
            self.cardsSelected++;
        }
    }
}



- (Card*)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count]) ? [self.cards objectAtIndex:index] : nil;
}


@end
