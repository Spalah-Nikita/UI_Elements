//
//  ListViewController.m
//  UI_ELEMENTS
//
//  Created by Nikita Vintonovich on 9/5/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataList;

@end

@implementation ListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.dataList = [NSMutableArray new];
    
    for (NSInteger i = 0; i < 20; i++)
    {
        NSString *str = [NSString stringWithFormat:@"String: %lu", i+1];
        [self.dataList addObject:str];
    }
}

#pragma mark - Table View Data Source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = self.dataList[indexPath.row];
    return cell;
}

@end
