//
//  TableViewController.m
//  UI_ELEMENTS
//
//  Created by Nikita Vintonovich on 9/8/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "TableViewController.h"

#import "ViewController.h"
#import "Coffee.h"

@interface TableViewController ()

@property (nonatomic, strong) NSMutableArray *coffeeArray;

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *coffeeNames = @[@"Late", @"Cappuccino", @"Espresso", @"Americano", @"CaramelMacchiato", @"CoffeeGlace", @"CoffeeMocha"];
    
    self.coffeeArray = [NSMutableArray new];
    
    for (NSInteger currentIndex = 0; currentIndex < coffeeNames.count; currentIndex++)
    {
        NSString *coffeeName = [coffeeNames objectAtIndex:currentIndex];
        Coffee *coffee = [Coffee coffeeWithName:coffeeName];
        [self.coffeeArray addObject:coffee];
    }
    
    self.clearsSelectionOnViewWillAppear = YES;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.coffeeArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Coffee *coffee = self.coffeeArray[indexPath.row];
    cell.textLabel.text = coffee.name;
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        // Delete the row from the data source
        [self.coffeeArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the coffeeArray, and add a new row to the table view
    }   
}

// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSString *movebleText = [self.coffeeArray objectAtIndex:fromIndexPath.row];
    NSString *staticText = [self.coffeeArray objectAtIndex:toIndexPath.row];
    
    [self.coffeeArray replaceObjectAtIndex:toIndexPath.row withObject:movebleText];
    [self.coffeeArray replaceObjectAtIndex:fromIndexPath.row withObject:staticText];
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    NSIndexPath *selectedCellIndexPath = [self.tableView indexPathForCell:cell];
    Coffee *coffee = [self.coffeeArray objectAtIndex:selectedCellIndexPath.row];
    
    ViewController *vc = [segue destinationViewController];
    vc.coffee = coffee;
}


@end
