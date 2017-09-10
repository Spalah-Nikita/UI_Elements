//
//  TableViewController.m
//  UI_ELEMENTS
//
//  Created by Nikita Vintonovich on 9/8/17.
//  Copyright © 2017 Vint-Rock. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

@interface TableViewController ()

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.array = [NSMutableArray new];
    
    for (NSInteger i = 0; i < 20; i++)
    {
        [self.array addObject:[NSString stringWithFormat:@"String: %lu", i+1]];
    }
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = YES;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *string = self.array[indexPath.row];
    cell.textLabel.text = string;
    
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    
    if (indexPath.row == 2)
    {
        return NO;
    }
    
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.array removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    NSString *movebleText = [self.array objectAtIndex:fromIndexPath.row];
    NSString *staticText = [self.array objectAtIndex:toIndexPath.row];
    
    [self.array replaceObjectAtIndex:toIndexPath.row withObject:movebleText];
    [self.array replaceObjectAtIndex:fromIndexPath.row withObject:staticText];
}



// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    
    if (indexPath.row == 5)
    {
        return NO;
    }
    
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *selecteCellString = self.array[indexPath.row];
    NSLog(@"Was selected: %@", selecteCellString);
}






#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    ViewController *vc = [segue destinationViewController];
    vc.titleVC = cell.textLabel.text;
    
}


@end
