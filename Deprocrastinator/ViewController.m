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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    cell.textLabel.text = [self.tasks objectAtIndex:1];
    
    NSLog(@"%@", [self.tasks objectAtIndex:indexPath.row]) ;
    return cell;
}

- (IBAction)onAddButtonPressed:(UIButton *)sender {
    NSString *addedTask = self.taskTextField.text;
    [self.tasks addObject:addedTask];
    [self.toDoListTableView reloadData];
    //[self.tasks addObject:self.taskTextField.text];
    
//    self.tasks = [NSMutableArray]
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 4;
}


@end
