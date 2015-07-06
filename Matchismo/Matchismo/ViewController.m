//
//  ViewController.m
//  Matchismo
//
//  Created by Toni on 02/07/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "ViewController.h"

#import "Deck.h"
#import "PlayingCardDeck.h"
#import "Card.h"
#import "CardMatchingGame.h"

@interface ViewController ()

@property (nonatomic, strong) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeControl;
@property (weak, nonatomic) IBOutlet UILabel *gameMessage;
@end

@implementation ViewController

- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                      cardsToSelect:[self gameMode]
                                                          usingDeck:[self createDeck]];
    return _game;
}


- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}
- (IBAction)gameModeChanged:(id)sender {
    [self restartGame];
}

- (NSUInteger)gameMode {
    switch (self.gameModeControl.selectedSegmentIndex) {
        case 0:
            return 2;
            break;
        case 1:
            return 3;
        default:
            return 2;
            break;
    }
}


- (IBAction)cardButtonTouched:(UIButton *)sender {
    
    if (self.gameModeControl.enabled) self.gameModeControl.enabled = NO;
    
    int choseButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:choseButtonIndex];
    [self updateUI];
}

- (void)updateUI {
    
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
        self.gameMessage.text = self.game.message;
    }
}

- (NSString *)titleForCard:(Card *)card {
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}

- (IBAction)restartButtonTouched:(UIButton *)sender {
    
    [self restartGame];
}

- (void)restartGame {
    
    self.gameModeControl.enabled = YES;
    
    self.scoreLabel.text = @"Score: 0";
    
    _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                          cardsToSelect:[self gameMode]
                                              usingDeck:[self createDeck]];
    [self updateUI];
}

@end
