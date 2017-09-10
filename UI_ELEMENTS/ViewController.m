//
//  ViewController.m
//  UI_ELEMENTS
//
//  Created by Nikita Vintonovich on 9/1/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *coffeeImageView;
@property (weak, nonatomic) IBOutlet UITextView *coffeeDescriptionTextView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.coffee)
    {
        self.navigationItem.title = self.coffee.name;
        self.coffeeDescriptionTextView.text = self.coffee.descriptionText;
        
        if (self.coffee.image)
        {
            self.coffeeImageView.image = self.coffee.image;
        }
    }
}

@end
