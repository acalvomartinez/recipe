//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Toni on 14/07/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardMatchingGame.h"
#import "Card.h"
#import "HistoryViewController.h"

@interface CardGameViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (nonatomic, strong) CardMatchingGame *game;
@property (nonatomic) NSInteger numberOfCardsToSelect;
@property (nonatomic, strong) NSMutableArray *historyStatus;
@property (nonatomic, strong) Card *touchedCard;
@end

@implementation CardGameViewController


- (void)viewDidLoad {
    [self updateUI];
}

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                      cardsToSelect:self.numberOfCardsToSelect
                                                          usingDeck:[self createDeck]];
    return _game;
}

- (NSMutableArray *)historyStatus
{
    if (!_historyStatus) _historyStatus = [NSMutableArray new];
    return _historyStatus;
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int choseButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:choseButtonIndex];
    self.touchedCard = [self.game cardAtIndex:choseButtonIndex];
    [self updateUI];
}

- (IBAction)dealButtonTouched:(UIButton *)sender
{
    [self restartGame];
}

- (void)restartGame
{
    
    self.scoreLabel.text = @"Score: 0";
    self.statusLabel.text = @"";
    
    _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                          cardsToSelect:self.numberOfCardsToSelect
                                              usingDeck:[self createDeck]];
    [self updateUI];
}

- (void)updateUI {
    
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setAttributedTitle:[self titleForCard:card]
                              forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
        
    }
    
    if ([self.game.chosenCards count] == self.numberOfCardsToSelect-1) {
        [self.statusLabel setAttributedText:[self statusInGameForCard:self.touchedCard
                                                      withChosenCards:self.game.chosenCards
                                                             andScore:self.game.matchScore]];
        
    }
}

- (NSAttributedString *)statusInGameForCard:(Card *)touchedCard
                            withChosenCards:(NSArray *)chosenCards
                                   andScore:(NSInteger)score {
    
    NSMutableAttributedString *status = [[NSMutableAttributedString alloc] init];
    
    [status appendAttributedString:[self descriptionForCard:touchedCard]];
    
    for (Card *card in chosenCards) {
        NSAttributedString *separator = [[NSAttributedString alloc] initWithString:@", "];
        [status appendAttributedString:separator];
        [status appendAttributedString:[self descriptionForCard:card]];
    }
    NSString *scoreText;
    if (score > 0) {
        scoreText = [NSString stringWithFormat:@" match! %d points!", score];
    } else {
        scoreText = [NSString stringWithFormat:@" don't match! %d point penalty!", score];
    }
    
    [status appendAttributedString:[[NSAttributedString alloc] initWithString:scoreText]];
    
    [self.historyStatus addObject:status];
    
    return status;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"History Segue"]) {
        HistoryViewController *hvc = segue.destinationViewController;
        hvc.texts = [self historyStatus];
    }
}

#pragma mark - Abstrac Methods

- (Deck *)createDeck {
    return nil;
}
- (NSAttributedString *)descriptionForCard:(Card *)card {
    return nil;
}
- (NSAttributedString *)titleForCard:(Card *)card  {
    return nil;
}
- (UIImage *)backgroundImageForCard:(Card *)card
{
    return nil;
}


@end
