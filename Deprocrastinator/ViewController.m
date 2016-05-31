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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    cell.textLabel.text = [self.tasks objectAtIndex:indexPath.row];
    
  
    return cell;
}

- (IBAction)onButtonPressed:(UIBarButtonItem *)sender {
    NSString *addedTask = self.taskTextField.text;
    [self.tasks addObject:addedTask];
    [self.toDoListTableView reloadData];
    [self.tasks addObject:self.taskTextField.text];
    NSLog(@"%@", self.tasks);
    //    self.tasks = [NSMutableArray]
    [self.taskTextField resignFirstResponder];
    self.taskTextField.text = nil;
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *addedTask = self.taskTextField.text;
    [self.tasks addObject:addedTask];
    [self.toDoListTableView reloadData];
    [self.tasks addObject:self.taskTextField.text];
 
    //    self.tasks = [NSMutableArray]
    [self.taskTextField resignFirstResponder];
    self.taskTextField.text = nil;
    return YES;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tasks.count;
}


@end
