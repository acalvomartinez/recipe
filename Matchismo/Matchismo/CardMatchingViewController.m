//
//  ViewController.m
//  Matchismo
//
//  Created by Toni on 02/07/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "CardMatchingViewController.h"

#import "Deck.h"
#import "PlayingCardDeck.h"
#import "Card.h"
#import "CardMatchingGame.h"
#import "HistoryViewController.h"

@interface CardMatchingViewController ()

@property (nonatomic) NSInteger numberOfCardsToSelect;

@end

@implementation CardMatchingViewController

- (NSInteger) numberOfCardsToSelect {
    if (!_numberOfCardsToSelect) _numberOfCardsToSelect = 2;
    return _numberOfCardsToSelect;
}

#pragma mark - Abstrac Methods

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

- (NSAttributedString *)descriptionForCard:(Card *)card
{
    return [[NSAttributedString alloc] initWithString:card.contents];
}

- (NSAttributedString *)titleForCard:(Card *)card
{
    NSMutableAttributedString *cardContents = [[NSMutableAttributedString alloc] initWithString:card.contents];
    NSMutableAttributedString *blank = [[NSMutableAttributedString alloc] initWithString:@""];
    return card.isChosen ? cardContents : blank;
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

@end
