//
//  ViewController.m
//  SMBDelegateMagic
//
//  Created by Samuel Boyce on 3/14/16.
//  Copyright © 2016 Samuel Boyce. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, strong) NSArray *invocation;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.invocation = @[@"Per Adonai Eloim", @"Adonai Jehova", @"Adonai Sabaoth", @"Metraton On Agla Mathon", @"verbum pythonicum", @"mysterium salamandrae", @"conventus sylvorum", @"antra gnomorum", @"daemonia Coeli God", @"Almonsin", @"Gibor", @"Jehosua", @"Evam", @"Zariatnatmik", @"veni, veni, veni"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.invocation.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    
    cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.invocation[indexPath.row];
    
    return cell;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.invocation.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return self.invocation[row];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.pickerView selectRow:indexPath.row inComponent:0 animated:YES];
    [self pickerView:self.pickerView didSelectRow:indexPath.row inComponent:0];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.label.text = self.invocation[row];
}

@end
