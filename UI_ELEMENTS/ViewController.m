//
//  ViewController.m
//  UI_ELEMENTS
//
//  Created by Nikita Vintonovich on 9/1/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "ViewController.h"
#import "ValidationModel.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firsNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

@property (weak, nonatomic) IBOutlet UILabel *infoLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoLabelTopConstraint;

@property (nonatomic, assign) NSInteger currentSelectedTextFieldIndex;

@end

@implementation ViewController

- (void)keyboardDidShow:(NSNotification*)notification
{
    self.contentViewTopConstraint.constant = 0.0f;
    
    // этот метод вызывается, когда клавиатура уже полностью видна на экране
    // и мы можем здесь изменить позицию contentView на столько, на сколько нам нужно
    NSValue *value = [notification.userInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardFrame = [value CGRectValue];
    
    //  находим текущий TextField
    UITextField *selectedTextField = [self arrayOfTextFields][self.currentSelectedTextFieldIndex];
    
    // обновляем позицию всего контента, если необходимо
    self.contentViewTopConstraint.constant = [self yPositionForTextFieldFrame:selectedTextField.frame keyboardYPosition:keyboardFrame.origin.y];
    
    // обновляем позицию лейбла
    self.infoLabelTopConstraint.constant = self.contentViewTopConstraint.constant;
}

- (void)keyboardDidHide:(NSNotification*)notification
{
    // этот метод вызывается, когда клавиатура уже полностью убрана с экрана
    // и мы возвращаем contentView на исходную позицию
    self.contentViewTopConstraint.constant = 0.0f;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    self.currentSelectedTextFieldIndex = textField.tag;
    self.infoLabel.text = @"";
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    BOOL isTextValid = [ValidationModel isTextValid:textField.text forTextFieldType:textField.tag];
    
    if (isTextValid == NO)
    {
        self.infoLabel.text = @"Invalid text";
        self.infoLabelTopConstraint.constant = textField.frame.origin.y + textField.frame.size.height;
        return NO;
    }
    
    if (isTextValid && textField.tag == ConfirmPasswordTextFieldType)
    {
        isTextValid = [ValidationModel confirmPassword:self.confirmPasswordTextField.text isEqualToPassword:self.passwordTextField.text];
        
        if (isTextValid == NO)
        {
            self.infoLabel.text = @"Wrong Confirm Password";
            self.infoLabelTopConstraint.constant = textField.frame.origin.y + textField.frame.size.height;
            return NO;
        }
    }
    
    if (isTextValid)
    {
        UITextField *nextTextField = [self nextTextFieldBySelectedIndex:textField.tag];
        
        if (nextTextField == nil)
        {
            [textField resignFirstResponder];
        }
        else
        {
            [nextTextField becomeFirstResponder];
        }
        
        self.currentSelectedTextFieldIndex = textField.tag;
    }
    
    return YES;
}

#pragma mark - Private Methods

- (UITextField *)nextTextFieldBySelectedIndex:(NSInteger)selectedIndex
{
    NSArray *textFieldsArray = [self arrayOfTextFields];
    
    UITextField *nextTextField = nil;
    NSInteger nextTextFieldIndex = [ValidationModel nextTextFieldIndexByIndex:selectedIndex];
    
    for (NSInteger i = 0; i < textFieldsArray.count; i++)
    {
        UITextField *currentTextField = textFieldsArray[nextTextFieldIndex];
        
        if (currentTextField.text.length == 0)
        {
            nextTextField = currentTextField;
            break;
        }
    }
    
    if (nextTextFieldIndex == 0)
    {
        self.contentViewTopConstraint.constant = 0.0f;
    }
    
    return nextTextField;
}

- (NSArray *)arrayOfTextFields
{
    return @[self.firsNameTextField,
             self.lastNameTextField,
             self.emailTextField,
             self.phoneNumberTextField,
             self.passwordTextField,
             self.confirmPasswordTextField];
}

- (CGFloat)yPositionForTextFieldFrame:(CGRect)frame keyboardYPosition:(CGFloat)keyboardY
{
    CGFloat resultY = 0.0f;
    
    CGFloat textFieldY = frame.origin.y;
    CGFloat textFieldHeight = frame.size.height;

    if ((textFieldY + textFieldHeight) > keyboardY)
    {
        resultY = fabs(keyboardY - (textFieldY + textFieldHeight));
    }
    
    return -textFieldY;
}

@end
