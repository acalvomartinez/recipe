//
//  HistoryViewController.m
//  Matchismo
//
//  Created by Toni on 09/07/15.
//  Copyright (c) 2015 Toni@Ironhack. All rights reserved.
//

#import "HistoryViewController.h"

@interface HistoryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *historyTextView;
@end

@implementation HistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"History";
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self updateUI];
}



- (void)updateUI {
    
    self.historyTextView.text = @"";
    
    NSMutableAttributedString *attributedText = [[NSMutableAttributedString alloc] init];
    
    for (NSAttributedString *text in self.texts) {
        [attributedText appendAttributedString:text];
        [attributedText appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n"]];
    }
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    [attributedText setAttributes:@{NSParagraphStyleAttributeName : paragraphStyle} range:NSMakeRange(0, [attributedText length])];
    
    [self.historyTextView.textStorage appendAttributedString:attributedText];
}




@end
