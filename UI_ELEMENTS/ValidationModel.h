//
//  ValidationModel.h
//  UI_ELEMENTS
//
//  Created by Nikita Vintonovich on 9/3/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, TextFieldType)
{
    FirstNameTextFieldType,
    LastNameTextFieldType,
    EmailTextFieldType,
    PhoneNumberTextFieldType,
    PasswordTextFieldType,
    ConfirmPasswordTextFieldType
};

@interface ValidationModel : NSObject

+ (BOOL)isTextValid:(NSString *)text forTextFieldType:(TextFieldType)textFieldType;
+ (BOOL)confirmPassword:(NSString *)confirmPassword isEqualToPassword:(NSString*)password;

+ (NSInteger)nextTextFieldIndexByIndex:(NSInteger)index;

@end
