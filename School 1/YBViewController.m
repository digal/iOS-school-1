//
//  YBViewController.m
//  School 1
//
//  Created by Yuriy Buyanov on 8/8/12.
//  Copyright (c) 2012 Yuriy Buyanov. All rights reserved.
//

#import "YBViewController.h"
#import "MyCustomCell.h"

@interface YBViewController ()<UITableViewDataSource, UITableViewDelegate> {
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) IBOutlet MyCustomCell *tmpCell;

@end

@implementation YBViewController
@synthesize tmpCell = _tmpCell;
@synthesize tableView=_tableView;

- (id) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.items = @[ @"One", @"Two", @"Three", @"Four", @"Five", @"Six", @"Seven", @"Eight", @"Nine", @"Ten", @"Eleven", @"Twelve"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(barButtonItemTap)];
}

- (void)barButtonItemTap {
    NSLog(@"barButtonItemTap");
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [self setTmpCell:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

#pragma mark -
#pragma mark UITableView Stuff

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellId = @"MyCell";
    
    MyCustomCell* cell = (MyCustomCell*)[tableView dequeueReusableCellWithIdentifier:cellId];

    if (!cell) {
        [[NSBundle mainBundle] loadNibNamed:@"MyCustomCell" owner:self options:nil];
        cell = self.tmpCell;
        self.tmpCell = nil;
        NSLog(@"Created new cell %@ for row: %d", cell, indexPath.row);
    } else {
        NSLog(@"Reused cell %@ for row: %d", cell, indexPath.row);
    }
    
    cell.label.text = [self.items objectAtIndex:indexPath.row];
    return cell;
}

@end
