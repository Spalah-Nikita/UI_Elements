//
//  ValidationModel.m
//  UI_ELEMENTS
//
//  Created by Nikita Vintonovich on 9/3/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "ValidationModel.h"

@implementation ValidationModel

+ (BOOL)isTextValid:(NSString *)text forTextFieldType:(TextFieldType)textFieldType
{
    BOOL result = NO;
    
    switch (textFieldType)
    {
        case FirstNameTextFieldType:
            result = YES;
            break;
        case LastNameTextFieldType:
            result = YES;
            break;
        case EmailTextFieldType:
            result = [ValidationModel isEmailValid:text];
            break;
        case PhoneNumberTextFieldType:
            result = YES;
            break;
        case PasswordTextFieldType:
            result = YES;
            break;
        case ConfirmPasswordTextFieldType:
            result = YES;
            break;
            
        default:
            break;
    }
    
    return result;
}

+ (BOOL)confirmPassword:(NSString *)confirmPassword isEqualToPassword:(NSString*)password
{
    return [confirmPassword isEqualToString:password];
}

+ (NSInteger)nextTextFieldIndexByIndex:(NSInteger)index
{
    NSInteger nextIndex = index + 1;
    
    if (nextIndex > ConfirmPasswordTextFieldType)
    {
        nextIndex = 0;
    }
    
    return nextIndex;
}


#pragma mark - Private Methods

+ (BOOL)isEmailValid:(NSString*)email
{
    for (NSInteger i = 0; i < email.length; i++)
    {
        NSString *currentSymbol = [email substringWithRange:NSMakeRange(i, 1)];
        
        if ([currentSymbol isEqualToString:@"@"])
        {
            return YES;
        }
    }
    
    return NO;
}

@end
