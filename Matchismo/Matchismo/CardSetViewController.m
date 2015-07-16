//
//  SetViewController.m
//  Matchismo
//
//  Created by Toni on 13/07/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "CardSetViewController.h"
#import "CardMatchingGame.h"
#import "HistoryViewController.h"
#import "Card.h"
#import "SetCard.h"
#import "SetDeck.h"

@interface CardSetViewController ()

@property (nonatomic) NSInteger numberOfCardsToSelect;

@end

@implementation CardSetViewController

- (NSInteger) numberOfCardsToSelect {
    if (!_numberOfCardsToSelect) _numberOfCardsToSelect = 3;
    return _numberOfCardsToSelect;
}

#pragma mark - Abstrac Methods

- (Deck *)createDeck {
    return [[SetDeck alloc] init];
}

- (NSAttributedString *)descriptionForCard:(Card *)card
{
    SetCard *setCard = (SetCard *)card;
    
    NSString *content = [NSString stringWithFormat:@"%d %d %d %d",setCard.color, setCard.shape, setCard.shade, setCard.value];
    return [[NSAttributedString alloc] initWithString:content];
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    SetCard *setCard = (SetCard *)card;
    
    NSString *content = [NSString stringWithFormat:@"%d %d %d %d",setCard.color, setCard.shape, setCard.shade, setCard.value];
    
    NSMutableAttributedString *cardContents = [[NSMutableAttributedString alloc] initWithString:content];
    return cardContents;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardsetback-chosen" : @"cardsetback"];
}

@end
