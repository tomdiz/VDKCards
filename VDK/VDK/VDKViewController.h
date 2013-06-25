//
//  VDKViewController.h
//  VDK
//
//  Created by Thomas DiZoglio on 5/12/13.
//  Copyright (c) 2013 Thomas DiZoglio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VDKViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *cardNumber;
@property (strong, nonatomic) IBOutlet UITextField *cardExpirationMonth;
@property (strong, nonatomic) IBOutlet UITextField *cardExpirationYear;
@property (strong, nonatomic) IBOutlet UITextField *cardCVV;
@property (strong, nonatomic) IBOutlet UITextField *cardZipCode;
@property (strong, nonatomic) IBOutlet UIImageView *cardImage;

- (IBAction)submitButtonPressed:(id)sender;

@end
