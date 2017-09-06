//
//  ThirdViewController.m
//  UI_ELEMENTS
//
//  Created by Nikita Vintonovich on 9/5/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (IBAction)backAction:(UIButton *)sender {
    
    NSArray *viewControllers = self.navigationController.viewControllers;
    
    UIViewController *firstVC = [viewControllers objectAtIndex:1];
    
    [self.navigationController popToViewController:firstVC animated:YES];
}


@end
