//
//  MyCustomCell.m
//  School 1
//
//  Created by Yuriy Buyanov on 8/11/12.
//  Copyright (c) 2012 Yuriy Buyanov. All rights reserved.
//

#import "MyCustomCell.h"

@implementation MyCustomCell
@synthesize label;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
