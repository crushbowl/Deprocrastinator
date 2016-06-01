//
//  ViewController.m
//  Deprocrastinator
//
//  Created by joy on 5/31/16.
//  Copyright © 2016 JanL. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *toDoListTableView;
@property (weak, nonatomic) IBOutlet UITextField *taskTextField;
@property NSMutableArray *tasks;

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // self.tasks = [[NSMutableArray alloc] init];
    self.tasks = [NSArray arrayWithObjects:@"get up", @"make coffee", nil].mutableCopy;

}
- (IBAction)onEditButtonPresssed:(UIBarButtonItem *)sender {
    /*[sender setTitle:@"EDIT" forState:UIControlStateNormal];*/
    sender.title =@"DONE";
    if (sender.title isEqualToString:"DONE") {
        
    }

}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
    
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.tasks removeObjectAtIndex:indexPath.row];
        [self.toDoListTableView reloadData];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)aTableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Detemine if it's in editing mode
    if (self.toDoListTableView.editing)
    {
        return UITableViewCellEditingStyleDelete;
    }
    
    return UITableViewCellEditingStyleNone;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    cell.textLabel.text = [self.tasks objectAtIndex:indexPath.row];
    
  
    return cell;
}

- (IBAction)onButtonPressed:(UIBarButtonItem *)sender {

    [self.tasks addObject:self.taskTextField.text];
    [self.toDoListTableView reloadData];
    NSLog(@"%@", self.tasks);
    //self.tasks = [NSMutableArray]
    [self.taskTextField resignFirstResponder];
    self.taskTextField.text = nil;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    //NSString *addedTask = self.taskTextField.text;
    //[self.tasks addObject:addedTask];
    [self.toDoListTableView reloadData];
    [self.tasks addObject:self.taskTextField.text];
    [self.taskTextField resignFirstResponder];
    self.taskTextField.text = nil;
    return YES;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor greenColor];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tasks.count;
}


@end
