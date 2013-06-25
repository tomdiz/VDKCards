/*
Copyright (c) 2012 Dexter Ang

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

#import <Foundation/Foundation.h>


@interface CreditCardCheck : NSObject {

}

+ (NSString *)cleanCreditCardNo:(NSString *)aCreditCardNo;
+ (NSString *)majorIndustryOf:(NSString *)aCreditCardNo;
+ (NSString *)issuerOf:(NSString *)aCreditCardNo;
+ (int)luhnCheckOf:(NSString *)aCreditCardNo;
+ (BOOL)validityOf:(int)aLuhnNo;

/* Sample credit card numbers that validate for testing:
 American Express	3400 0000 0000 009
 Carte Blanche		3000 0000 0000 04
 Discover			6011 0000 0000 0004
 Diner's Club		3000 0000 0000 04
 enRoute			2014 0000 0000 009
 JCB				2131 0000 0000 0008
 MasterCard			5500 0000 0000 0004
 Solo				6334 0000 0000 0004
 Switch				4903 0100 0000 0009
 Visa				4111 1111 1111 1111
 */

@end
