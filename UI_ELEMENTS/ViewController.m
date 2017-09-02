//
//  ViewController.m
//  UI_ELEMENTS
//
//  Created by Nikita Vintonovich on 9/1/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "ViewController.h"

static const NSString *kName = @"ram";
static CGFloat const kValue = 3.0f;

typedef struct
{
    CGFloat weight;
    NSUInteger age;
} Person;

@interface ViewController () <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

@end

@implementation ViewController

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSString *someString = @"I will be iOS Developer";
    
    NSRange range = NSMakeRange(2, 4);
    
    NSString *resultStirng = [someString substringWithRange:range];
    NSLog(@"%@", resultStirng);
    
    
    Person person;
    
    person.age = 20;
    person.weight = 76;
    
    if (textField.tag == 5)
    {
        CGRect fieldFrame = textField.frame;
        
        fieldFrame.origin.y =  self.emailTextField.frame.origin.y + self.emailTextField.frame.size.height + 40;
        
        textField.frame = fieldFrame;
    }
    
    NSLog(@"\ntextFieldDidBeginEditing\n");
    
    if (textField.tag == 5)
    {
        textField.secureTextEntry = YES;
    }
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"\ntextFieldDidEndEditing\n");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"\ntextFieldShouldReturn\n");
    
    if (textField.tag == 5)
    {
        [self.emailTextField becomeFirstResponder];
    }
    else
    {
        [self.passwordTextField becomeFirstResponder];
    }
    
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"\ntextFieldShouldEndEditing\n");
    if (textField.text.length < 5)
    {
        return NO;
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"\ntextFieldShouldBeginEditing\n");
//    if (textField.tag == 5 && self.emailTextField.text.length < 5)
//    {
//        return NO;
//    }
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSLog(@"\nshouldChangeCharactersInRange\n");
    
    if ([string isEqualToString:@"+"])
    {
        return NO;
    }
    
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return YES;
}

@end
