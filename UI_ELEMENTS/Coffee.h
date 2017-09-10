//
//  Coffee.h
//  UI_ELEMENTS
//
//  Created by Nikita Vintonovich on 9/10/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Coffee : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSNumber *price;
@property (nonatomic, strong) NSString *descriptionText;
@property (nonatomic, strong) UIImage *image;

+ (Coffee*)coffeeWithName:(NSString*)name;

@end
