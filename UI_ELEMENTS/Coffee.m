//
//  Coffee.m
//  UI_ELEMENTS
//
//  Created by Nikita Vintonovich on 9/10/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "Coffee.h"

@implementation Coffee

+ (Coffee*)coffeeWithName:(NSString*)name;
{
    NSString *coffeeNameLocalizedKey = [NSString stringWithFormat:@"%@.name", name];
    NSString *coffeeDesciptionTextLocalizedKey = [NSString stringWithFormat:@"%@.description", name];
    NSNumber *coffeePrice = @(12.00 + (arc4random() % 10));
    UIImage *coffeeImage = [UIImage imageNamed:name];
    
    Coffee *coffee = [Coffee new];
    
    coffee.name = NSLocalizedString(coffeeNameLocalizedKey, nil);
    coffee.descriptionText = NSLocalizedString(coffeeDesciptionTextLocalizedKey, nil);
    coffee.price = coffeePrice;
    coffee.image = coffeeImage;
    
    return coffee;
}

@end
