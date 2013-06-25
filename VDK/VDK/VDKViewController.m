//
//  VDKViewController.m
//  VDK
//
//  Created by Thomas DiZoglio on 5/12/13.
//  Copyright (c) 2013 Thomas DiZoglio. All rights reserved.
//

#import "VDKViewController.h"
#import "CreditCardCheck.h"

@interface VDKViewController ()

@end

@implementation VDKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	[_cardNumber addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [_cardCVV setReturnKeyType:UIReturnKeyDone];
    _cardCVV.delegate = self;
    [_cardExpirationMonth setReturnKeyType:UIReturnKeyDone];
    _cardExpirationMonth.delegate = self;
    [_cardExpirationYear setReturnKeyType:UIReturnKeyDone];
    _cardExpirationYear.delegate = self;
    [_cardNumber setReturnKeyType:UIReturnKeyDone];
    _cardNumber.delegate = self;
    [_cardZipCode setReturnKeyType:UIReturnKeyDone];
    _cardZipCode.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidChange:(id)sender {
    
    NSString *cc_num_string = ((UITextField*)sender).text;
    int cc_length = [cc_num_string length];
    
    if (cc_length >= 1 && [cc_num_string characterAtIndex:0] == '4') {
        
        _cardImage.image = [UIImage imageNamed:@"VDKVisa.png"];
    }
    else if (cc_length > 1 && [cc_num_string characterAtIndex:0] == '5' && ([cc_num_string characterAtIndex:1] == '1' || [cc_num_string characterAtIndex:1] == '5')) {
        
        _cardImage.image = [UIImage imageNamed:@"VDKMastercard.png"];
    }
    else if (cc_length > 1 && [cc_num_string characterAtIndex:0] == '6' && ([cc_num_string characterAtIndex:1] == '5' || (cc_length > 2 &&cc_length > 1 && [cc_num_string characterAtIndex:1] == '4' && [cc_num_string characterAtIndex:2] == '4') || (cc_length > 3 && [cc_num_string characterAtIndex:1] == '0' && [cc_num_string characterAtIndex:2] == '1' && [cc_num_string characterAtIndex:3] == '1' ))) {
        
        _cardImage.image = [UIImage imageNamed:@"VDKDiscover.png"];
    }
    else if (cc_length > 1 && [cc_num_string characterAtIndex:0] == '3' && ([cc_num_string characterAtIndex:1] == '4' || [cc_num_string characterAtIndex:1] == '7')) {
        
        _cardImage.image = [UIImage imageNamed:@"VDKAmex.png"];
    }
    else if (cc_length > 1 && [cc_num_string characterAtIndex:0] == '5' && ([cc_num_string characterAtIndex:1] == '4' || [cc_num_string characterAtIndex:1] == '5')) {
        
        _cardImage.image = [UIImage imageNamed:@"VDKDinersClub.png"];
    }
    else if (cc_length > 1 && [cc_num_string characterAtIndex:0] == '3' && ([cc_num_string characterAtIndex:1] == '5')) {
        
        _cardImage.image = [UIImage imageNamed:@"VDKJCB.png"];
    }
    else {
        _cardImage.image = [UIImage imageNamed:@"VDKGenericCard.png"];
    }
}

- (IBAction)submitButtonPressed:(id)sender {

    NSString *cleanCCNumber = [CreditCardCheck cleanCreditCardNo:_cardNumber.text];
    int luhnNumber = [CreditCardCheck luhnCheckOf:cleanCCNumber];

    if ([CreditCardCheck validityOf:luhnNumber]) {

        // Make sure month and year
        int month = [_cardExpirationMonth.text intValue];
        int year = [_cardExpirationYear.text intValue];
        if (month < 0 || month > 12) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"VDK Card" message: @"Month is wrong!" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else if (year < 2012) {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"VDK Card" message: @"Year is wrong!" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else {
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"VDK Card" message: @"Success!" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
    }
    else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"VDK Card" message: @"Luhn Check failed!" delegate: nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
}

#pragma UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    [textField resignFirstResponder];
    return YES;
}

@end
